@implementation TLKSplitTitleContainer

- (TLKSplitTitleContainer)init
{
  TLKSplitTitleContainer *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  TLKStackView *v7;
  void *v8;
  TLKStackView *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)TLKSplitTitleContainer;
  v2 = -[TLKSplitTitleContainer init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setTextAlignment:", 1);
    LODWORD(v4) = 1132068864;
    objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v4);
    -[TLKSplitTitleContainer setTitleLabel:](v2, "setTitleLabel:", v3);
    v5 = (void *)objc_opt_new();
    -[TLKSplitTitleContainer setCenterLeadingTitleLabel:](v2, "setCenterLeadingTitleLabel:", v5);
    v6 = (void *)objc_opt_new();
    -[TLKSplitTitleContainer setCenterTrailingTitleLabel:](v2, "setCenterTrailingTitleLabel:", v6);
    v7 = [TLKStackView alloc];
    v13[0] = v5;
    v13[1] = v3;
    v13[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NUIContainerStackView initWithArrangedSubviews:](v7, "initWithArrangedSubviews:", v8);

    -[TLKStackView setAlignment:forView:inAxis:](v9, "setAlignment:forView:inAxis:", 4, v5, 0);
    -[TLKStackView setAlignment:forView:inAxis:](v9, "setAlignment:forView:inAxis:", 1, v6, 0);
    -[TLKSplitTitleContainer setTitleStackView:](v2, "setTitleStackView:", v9);
    -[TLKSplitTitleContainer titleStackView](v2, "titleStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKSplitTitleContainer addSubview:](v2, "addSubview:", v10);

  }
  return v2;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TLKSplitTitleContainer;
  -[TLKSplitTitleContainer setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TLKSplitTitleContainer setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TLKSplitTitleContainer titleFont](self, "titleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitTitleContainer titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  -[TLKSplitTitleContainer centerLeadingTitleLabel](self, "centerLeadingTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v6);

  -[TLKSplitTitleContainer centerTrailingTitleLabel](self, "centerTrailingTitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v6);

  -[TLKSplitTitleContainer titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isHidden");

  if ((v11 & 1) == 0)
  {
    -[TLKSplitTitleContainer titleStackView](self, "titleStackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "spacing");
    v14 = v13;
    -[TLKSplitTitleContainer titleStackView](self, "titleStackView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrangedSubviews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = width - v14 * (double)(unint64_t)(objc_msgSend(v16, "count") - 1);

    -[TLKSplitTitleContainer titleFont](self, "titleFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pointSize");
    v20 = v19;

    if (!-[TLKSplitTitleContainer titleLabelsFitInWidth:pointSize:](self, "titleLabelsFitInWidth:pointSize:", v17, v20))
    {
      v21 = 10.0;
      if (v20 > 10.0 && v20 + -10.0 > 1.0)
      {
        do
        {
          v22 = (v21 + v20) * 0.5;
          if (-[TLKSplitTitleContainer titleLabelsFitInWidth:pointSize:](self, "titleLabelsFitInWidth:pointSize:", v17, v22))
          {
            v21 = v22 + 1.0;
          }
          else
          {
            v20 = v22;
          }
        }
        while (v21 < v20 && v20 - v21 > 1.0);
      }
      objc_msgSend(v6, "fontWithSize:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKSplitTitleContainer titleLabel](self, "titleLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setFont:", v24);

      objc_msgSend(v6, "fontWithSize:", v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKSplitTitleContainer centerLeadingTitleLabel](self, "centerLeadingTitleLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setFont:", v26);

      objc_msgSend(v6, "fontWithSize:", v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKSplitTitleContainer centerTrailingTitleLabel](self, "centerTrailingTitleLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFont:", v28);

    }
  }
  -[TLKSplitTitleContainer titleStackView](self, "titleStackView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "effectiveLayoutSizeFittingSize:", width, height);
  v32 = v31;
  v34 = v33;

  v35 = v32;
  v36 = v34;
  result.height = v36;
  result.width = v35;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
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
  void *v18;
  double MidX;
  CGFloat v20;
  void *v21;
  void *v22;
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
  void *v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;

  v35.receiver = self;
  v35.super_class = (Class)TLKSplitTitleContainer;
  -[TLKSplitTitleContainer layoutSubviews](&v35, sel_layoutSubviews);
  -[TLKSplitTitleContainer titleStackView](self, "titleStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitTitleContainer bounds](self, "bounds");
  objc_msgSend(v3, "effectiveLayoutSizeFittingSize:", v4, v5);
  v7 = v6;
  v9 = v8;

  -[TLKSplitTitleContainer bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[TLKSplitTitleContainer titleStackView](self, "titleStackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  -[TLKSplitTitleContainer bounds](self, "bounds");
  MidX = CGRectGetMidX(v36);
  -[TLKSplitTitleContainer bounds](self, "bounds");
  v20 = CGRectGetHeight(v37) - v9;
  -[TLKSplitTitleContainer titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "descender");
  v24 = v20 - v23;

  if (-[TLKSplitTitleContainer useLargeTitle](self, "useLargeTitle"))
    v25 = v24 + -9.0;
  else
    v25 = v24;
  +[TLKLayoutUtilities deviceScaledRoundedRect:forView:](TLKLayoutUtilities, "deviceScaledRoundedRect:forView:", self, MidX + v7 * -0.5, v25, v7, v9);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[TLKSplitTitleContainer titleStackView](self, "titleStackView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

}

- (BOOL)titleLabelsFitInWidth:(double)a3 pointSize:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;

  -[TLKSplitTitleContainer titleFont](self, "titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontWithSize:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_class();
  -[TLKSplitTitleContainer centerLeadingTitleLabel](self, "centerLeadingTitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widthForString:font:", v11, v8);
  v13 = v12;
  v14 = (void *)objc_opt_class();
  -[TLKSplitTitleContainer titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "widthForString:font:", v16, v8);
  v18 = v13 + v17;
  v19 = (void *)objc_opt_class();
  -[TLKSplitTitleContainer centerTrailingTitleLabel](self, "centerTrailingTitleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widthForString:font:", v21, v8);
  v23 = v18 + v22;

  return v23 < a3;
}

+ (double)widthForString:(id)a3 font:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = *MEMORY[0x1E0DC32A0];
  v13[0] = a4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, 1.79769313e308, 1.79769313e308);
  v10 = v9;

  return v10;
}

- (id)titleFont
{
  _BOOL4 v2;
  _QWORD *v3;

  v2 = -[TLKSplitTitleContainer useLargeTitle](self, "useLargeTitle");
  v3 = (_QWORD *)MEMORY[0x1E0DC4AE8];
  if (!v2)
    v3 = (_QWORD *)MEMORY[0x1E0DC4B58];
  return +[TLKFontUtilities cachedFontForTextStyle:isShort:fontWeight:](TLKFontUtilities, "cachedFontForTextStyle:isShort:fontWeight:", *v3, TLKSnippetModernizationEnabled() ^ 1, *MEMORY[0x1E0DC4B88]);
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (TLKLabel)centerLeadingTitleLabel
{
  return self->_centerLeadingTitleLabel;
}

- (void)setCenterLeadingTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_centerLeadingTitleLabel, a3);
}

- (TLKLabel)centerTrailingTitleLabel
{
  return self->_centerTrailingTitleLabel;
}

- (void)setCenterTrailingTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_centerTrailingTitleLabel, a3);
}

- (TLKStackView)titleStackView
{
  return self->_titleStackView;
}

- (void)setTitleStackView:(id)a3
{
  objc_storeStrong((id *)&self->_titleStackView, a3);
}

- (BOOL)useLargeTitle
{
  return self->_useLargeTitle;
}

- (void)setUseLargeTitle:(BOOL)a3
{
  self->_useLargeTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_centerTrailingTitleLabel, 0);
  objc_storeStrong((id *)&self->_centerLeadingTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
