@implementation SPUICompletionStringView

- (void)setTextColorForCompletionLabel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SPUICompletionStringView completionLabel](self, "completionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  -[SPUICompletionStringView updateFields](self, "updateFields");
}

- (void)updateWithResult:(id)a3 cardSection:(id)a4 focusIsOnFirstResult:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  -[SPUICompletionStringView result](self, "result");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v11 && -[SPUICompletionStringView focusIsOnFirstResult](self, "focusIsOnFirstResult") == v5)
  {
    -[SPUICompletionStringView cardSection](self, "cardSection");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v8)
      goto LABEL_5;
  }
  else
  {

  }
  -[SPUICompletionStringView setResult:](self, "setResult:", v11);
  -[SPUICompletionStringView setCardSection:](self, "setCardSection:", v8);
  -[SPUICompletionStringView setFocusIsOnFirstResult:](self, "setFocusIsOnFirstResult:", v5);
  -[SPUICompletionStringView updateFields](self, "updateFields");
LABEL_5:

}

- (BOOL)focusIsOnFirstResult
{
  return self->_focusIsOnFirstResult;
}

- (BOOL)hasContent
{
  void *v2;
  BOOL v4;
  int v5;
  void *v6;

  v4 = -[SPUICompletionStringView hasPrefix](self, "hasPrefix");
  if (!v4)
  {
    -[SPUICompletionStringView extensionLabel](self, "extensionLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isHidden") & 1) != 0)
    {
      LOBYTE(v5) = 0;
LABEL_5:

      return v5;
    }
  }
  -[SPUICompletionStringView labelsStackView](self, "labelsStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isHidden") ^ 1;

  if (!v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)hasPrefix
{
  void *v3;
  double v4;
  void *v5;
  int v6;

  -[SPUICompletionStringView completionLabel](self, "completionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  if (v4 == 0.0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    -[SPUICompletionStringView labelsStackView](self, "labelsStackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHidden") ^ 1;

  }
  return v6;
}

- (id)completionLabel
{
  void *v2;
  void *v3;

  -[SPUICompletionStringView labelsStackView](self, "labelsStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SPUIMaskedLabelsStackView)labelsStackView
{
  return (SPUIMaskedLabelsStackView *)objc_getProperty(self, a2, 752, 1);
}

- (id)extensionLabel
{
  void *v2;
  void *v3;

  -[SPUICompletionStringView labelsStackView](self, "labelsStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateFields
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
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
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;

  -[SPUICompletionStringView searchFieldModel](self, "searchFieldModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "searchFieldHasTokens") & 1) != 0
    || (-[SPUICompletionStringView result](self, "result"), (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_7;
  }
  v5 = (void *)v4;
  -[SPUICompletionStringView searchFieldModel](self, "searchFieldModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasMarkedText");

  if ((v7 & 1) != 0)
  {
LABEL_7:
    -[SPUICompletionStringView labelsStackView](self, "labelsStackView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);

    -[SPUICompletionStringView imageView](self, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", 1);

    -[SPUICompletionStringView imageView](self, "imageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateWithImage:", 0);

    v22 = 0;
    goto LABEL_8;
  }
  -[SPUICompletionStringView extensionLabel](self, "extensionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", 0);

  -[SPUICompletionStringView labelsStackView](self, "labelsStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUICompletionStringView searchFieldModel](self, "searchFieldModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTypedString:", v11);

  v12 = (void *)MEMORY[0x24BE85250];
  -[SPUICompletionStringView searchFieldModel](self, "searchFieldModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUICompletionStringView result](self, "result");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUICompletionStringView cardSection](self, "cardSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "initWithTypedString:result:cardSection:", v14, v15, v16);
  v49 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "completionString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v49, "extensionString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[SPUICompletionStringView searchFieldModel](self, "searchFieldModel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "queryId");
      -[SPUICompletionStringView result](self, "result");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v26 == objc_msgSend(v27, "queryId");

    }
    else
    {
      v18 = 0;
    }

  }
  objc_msgSend(v49, "completionString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUICompletionStringView completionLabel](self, "completionLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAttributedText:", v28);

  if (v18)
  {
    -[SPUICompletionStringView searchFieldModel](self, "searchFieldModel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "displayedText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUICompletionStringView completionLabel](self, "completionLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setText:", v31);

  }
  objc_msgSend(v49, "completionString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    v34 = 1.0;
  else
    v34 = 0.0;
  -[SPUICompletionStringView completionLabel](self, "completionLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAlpha:", v34);

  objc_msgSend(v49, "completionString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    v37 = 1;
  else
    v37 = v18;

  if (v37 == 1)
  {
    objc_msgSend(v49, "extensionString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUICompletionStringView extensionLabel](self, "extensionLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", v38);

    objc_msgSend(v49, "bridgeString");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUICompletionStringView bridgeLabel](self, "bridgeLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setText:", v40);

  }
  -[SPUICompletionStringView extensionLabel](self, "extensionLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setHidden:", v37 ^ 1u);

  -[SPUICompletionStringView bridgeLabel](self, "bridgeLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setHidden:", v37 ^ 1u);

  if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
  {
    v44 = (void *)MEMORY[0x24BE85258];
    objc_msgSend(v49, "image");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "imageWithSFImage:variantForAppIcon:", v45, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    -[SPUICompletionStringView imageView](self, "imageView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v46)
      objc_msgSend(v47, "updateWithImage:", v46);
    else
      objc_msgSend(v47, "setHidden:", 1);

  }
  -[SPUICompletionStringView updateLayoutMargins](self, "updateLayoutMargins");
  v22 = v49;
LABEL_8:
  v50 = v22;
  -[SPUICompletionStringView setCompletion:](self, "setCompletion:", v22);
  -[SPUICompletionStringView superview](self, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNeedsLayout");

}

- (SearchUIImageView)imageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 744, 1);
}

- (SFSearchResult)result
{
  return (SFSearchResult *)objc_getProperty(self, a2, 736, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
}

- (SPUICompletionStringModel)searchFieldModel
{
  return self->_searchFieldModel;
}

- (void)setResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 736);
}

- (void)setFocusIsOnFirstResult:(BOOL)a3
{
  self->_focusIsOnFirstResult = a3;
}

- (void)setCardSection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (void)setFontForCompletionLabel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPUICompletionStringView labelsStackView](self, "labelsStackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (SPUICompletionStringView)init
{
  SPUICompletionStringView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)SPUICompletionStringView;
  v2 = -[SPUICompletionStringView init](&v20, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SPUICompletionStringView setLabelsStackView:](v2, "setLabelsStackView:", v3);

    -[SPUICompletionStringView labelsStackView](v2, "labelsStackView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    -[SPUICompletionStringView completionLabel](v2, "completionLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

    -[SPUICompletionStringView labelsStackView](v2, "labelsStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1148846080;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 1, v7);

    -[SPUICompletionStringView setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 0);
    -[SPUICompletionStringView setLayoutMarginsRelativeArrangement:](v2, "setLayoutMarginsRelativeArrangement:", 1);
    -[NUIContainerStackView setAlignment:](v2, "setAlignment:", 3);
    -[NUIContainerStackView setSpacing:](v2, "setSpacing:", 0.0);
    -[SPUICompletionStringView labelsStackView](v2, "labelsStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
    {
      v10 = (void *)objc_opt_new();
      -[SPUICompletionStringView setImageView:](v2, "setImageView:", v10);

      -[SPUICompletionStringView imageView](v2, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", v2);

      v12 = (void *)MEMORY[0x24BE85220];
      -[SPUICompletionStringView imageView](v2, "imageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "requireIntrinsicSizeForView:", v13);

      -[SPUICompletionStringView imageView](v2, "imageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayByAddingObject:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      -[SPUICompletionStringView imageView](v2, "imageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMaximumLayoutSize:", 33.0, 33.0);

      -[SPUICompletionStringView imageView](v2, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setMinimumLayoutSize:", 33.0, 33.0);

      v9 = (void *)v15;
    }
    -[SPUICompletionStringView setArrangedSubviews:](v2, "setArrangedSubviews:", v9);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemFillColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUICompletionStringView setSelectionHighlightColor:](v2, "setSelectionHighlightColor:", v18);

  }
  return v2;
}

- (void)setSelectionHighlightColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (v5 && self->_selectionHighlightColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectionHighlightColor, a3);
    -[SPUICompletionStringView updateFields](self, "updateFields");
    v5 = v6;
  }

}

- (void)setLabelsStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

- (id)bridgeLabel
{
  void *v2;
  void *v3;

  -[SPUICompletionStringView labelsStackView](self, "labelsStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bridgeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIColor)textColorForCompletionLabel
{
  void *v2;
  void *v3;

  -[SPUICompletionStringView completionLabel](self, "completionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIFont)fontForCompletionLabel
{
  void *v2;
  void *v3;

  -[SPUICompletionStringView completionLabel](self, "completionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setSearchFieldModel:(id)a3
{
  SPUICompletionStringModel *v5;
  SPUICompletionStringModel *v6;

  v5 = (SPUICompletionStringModel *)a3;
  if (self->_searchFieldModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_searchFieldModel, a3);
    -[SPUICompletionStringView updateFields](self, "updateFields");
    v5 = v6;
  }

}

- (void)didUpdateWithImage:(id)a3
{
  void *v4;

  -[SPUICompletionStringView imageView](self, "imageView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[SPUICompletionStringView updateLayoutMargins](self, "updateLayoutMargins");
}

- (void)didFailToLoadImage
{
  void *v3;

  -[SPUICompletionStringView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[SPUICompletionStringView updateLayoutMargins](self, "updateLayoutMargins");
}

- (NSString)copyableString
{
  void *v2;
  void *v3;

  -[SPUICompletionStringView completion](self, "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "copyableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  void *v2;
  char v3;

  -[SPUICompletionStringView completion](self, "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "completionResultIsPotentiallyPunchout");

  return v3;
}

- (void)updateLayoutMargins
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;

  -[SPUICompletionStringView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SPUICompletionStringView imageView](self, "imageView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SPUICompletionStringView imageView](self, "imageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isHidden") ^ 1;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  -[SPUICompletionStringView completionLabel](self, "completionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alpha");
  v10 = v9;
  if (v9 == 0.0)
  {
    -[SPUICompletionStringView extensionLabel](self, "extensionLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v2, "isHidden") & (v7 ^ 1);
  }
  else
  {
    v11 = 0;
  }
  -[SPUICompletionStringView labelsStackView](self, "labelsStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v11);

  if (v10 == 0.0)
  if (v7)
    v13 = 8.0;
  else
    v13 = 0.0;
  -[SPUICompletionStringView setLayoutMargins:](self, "setLayoutMargins:", 0.0, 0.0, 0.0, v13);
}

- (NSString)completionText
{
  void *v3;
  void *v4;

  if (-[SPUICompletionStringView hasPrefix](self, "hasPrefix"))
  {
    -[SPUICompletionStringView completionLabel](self, "completionLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (double)trailingPaddingForFieldEditor
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[SPUICompletionStringView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0.0;
  -[NUIContainerStackView spacing](self, "spacing");
  v6 = v5;
  -[SPUICompletionStringView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v6 + v9;

  return v10;
}

- (UIColor)selectionHighlightColor
{
  return self->_selectionHighlightColor;
}

- (void)setImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 744);
}

- (SFCardSection)cardSection
{
  return (SFCardSection *)objc_getProperty(self, a2, 760, 1);
}

- (SearchUICompletion)completion
{
  return (SearchUICompletion *)objc_getProperty(self, a2, 768, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_selectionHighlightColor, 0);
  objc_storeStrong((id *)&self->_searchFieldModel, 0);
}

@end
