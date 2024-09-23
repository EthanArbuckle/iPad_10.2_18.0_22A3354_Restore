@implementation SearchUICompletionStringView

- (SearchUICompletionStringView)init
{
  SearchUICompletionStringView *v2;
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
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)SearchUICompletionStringView;
  v2 = -[SearchUICompletionStringView init](&v20, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SearchUICompletionStringView setLabelsStackView:](v2, "setLabelsStackView:", v3);

    -[SearchUICompletionStringView labelsStackView](v2, "labelsStackView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    -[SearchUICompletionStringView completionLabel](v2, "completionLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

    -[SearchUICompletionStringView labelsStackView](v2, "labelsStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v7);

    -[NUIContainerStackView setAlignment:](v2, "setAlignment:", 3);
    -[NUIContainerStackView setSpacing:](v2, "setSpacing:", 11.0);
    -[SearchUICompletionStringView labelsStackView](v2, "labelsStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)objc_opt_class(), "supportsImages"))
    {
      v10 = (void *)objc_opt_new();
      -[SearchUICompletionStringView setImageView:](v2, "setImageView:", v10);

      -[SearchUICompletionStringView imageView](v2, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", v2);

      -[SearchUICompletionStringView imageView](v2, "imageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v12);

      -[SearchUICompletionStringView imageView](v2, "imageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayByAddingObject:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      -[SearchUICompletionStringView imageView](v2, "imageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = 1148846080;
      objc_msgSend(v15, "setLayoutSize:withContentPriority:", 32.0, 32.0, v16);

      -[SearchUICompletionStringView imageView](v2, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCustomAlignmentRectInsets:", 1.0, 1.0, 3.0, 1.0);

      v9 = (void *)v14;
    }
    -[SearchUICompletionStringView setArrangedSubviews:](v2, "setArrangedSubviews:", v9);
    -[SearchUICompletionStringView setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICompletionStringView setSelectionHighlightColor:](v2, "setSelectionHighlightColor:", v18);

  }
  return v2;
}

+ (BOOL)supportsImages
{
  return +[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad")
      || +[SearchUIUtilities isLargeIpad](SearchUIUtilities, "isLargeIpad");
}

- (id)extensionLabel
{
  void *v2;
  void *v3;

  -[SearchUICompletionStringView labelsStackView](self, "labelsStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bridgeLabel
{
  void *v2;
  void *v3;

  -[SearchUICompletionStringView labelsStackView](self, "labelsStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bridgeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)completionLabel
{
  void *v2;
  void *v3;

  -[SearchUICompletionStringView labelsStackView](self, "labelsStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTextColorForCompletionLabel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SearchUICompletionStringView completionLabel](self, "completionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  -[SearchUICompletionStringView updateFields](self, "updateFields");
}

- (UIColor)textColorForCompletionLabel
{
  void *v2;
  void *v3;

  -[SearchUICompletionStringView completionLabel](self, "completionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setFontForCompletionLabel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUICompletionStringView labelsStackView](self, "labelsStackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (UIFont)fontForCompletionLabel
{
  void *v2;
  void *v3;

  -[SearchUICompletionStringView completionLabel](self, "completionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setSearchFieldModel:(id)a3
{
  SearchUICompletionStringModel *v5;
  SearchUICompletionStringModel *v6;

  v5 = (SearchUICompletionStringModel *)a3;
  if (self->_searchFieldModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_searchFieldModel, a3);
    -[SearchUICompletionStringView updateFields](self, "updateFields");
    v5 = v6;
  }

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
    -[SearchUICompletionStringView updateFields](self, "updateFields");
    v5 = v6;
  }

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
  -[SearchUICompletionStringView result](self, "result");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v11 && -[SearchUICompletionStringView focusIsOnFirstResult](self, "focusIsOnFirstResult") == v5)
  {
    -[SearchUICompletionStringView cardSection](self, "cardSection");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v8)
      goto LABEL_5;
  }
  else
  {

  }
  -[SearchUICompletionStringView setResult:](self, "setResult:", v11);
  -[SearchUICompletionStringView setCardSection:](self, "setCardSection:", v8);
  -[SearchUICompletionStringView setFocusIsOnFirstResult:](self, "setFocusIsOnFirstResult:", v5);
  -[SearchUICompletionStringView updateFields](self, "updateFields");
LABEL_5:

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
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  double v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
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
  id v48;
  id v49;

  -[SearchUICompletionStringView searchFieldModel](self, "searchFieldModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "searchFieldHasTokens") & 1) != 0
    || (-[SearchUICompletionStringView result](self, "result"), (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_7;
  }
  v5 = (void *)v4;
  -[SearchUICompletionStringView searchFieldModel](self, "searchFieldModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasMarkedText");

  if ((v7 & 1) != 0)
  {
LABEL_7:
    -[SearchUICompletionStringView labelsStackView](self, "labelsStackView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 1);

    -[SearchUICompletionStringView imageView](self, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);

    -[SearchUICompletionStringView extensionLabel](self, "extensionLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", 0);

    -[SearchUICompletionStringView completionLabel](self, "completionLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", 0);

    -[SearchUICompletionStringView imageView](self, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateWithImage:", 0);

    v23 = 0;
    goto LABEL_8;
  }
  -[SearchUICompletionStringView extensionLabel](self, "extensionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", 0);

  -[SearchUICompletionStringView labelsStackView](self, "labelsStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompletionStringView searchFieldModel](self, "searchFieldModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTypedString:", v11);

  -[SearchUICompletionStringView searchFieldModel](self, "searchFieldModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompletionStringView result](self, "result");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompletionStringView cardSection](self, "cardSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICompletion initWithTypedString:result:cardSection:](SearchUICompletion, "initWithTypedString:result:cardSection:", v13, v14, v15);
  v48 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "completionString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v48, "extensionString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v25 != 0;

  }
  objc_msgSend(v48, "completionString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompletionStringView completionLabel](self, "completionLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAttributedText:", v26);

  if (v17)
  {
    -[SearchUICompletionStringView searchFieldModel](self, "searchFieldModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "displayedText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICompletionStringView completionLabel](self, "completionLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v29);

  }
  objc_msgSend(v48, "completionString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "length"))
    v32 = 1;
  else
    v32 = v17;
  v33 = (double)v32;
  -[SearchUICompletionStringView completionLabel](self, "completionLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAlpha:", v33);

  objc_msgSend(v48, "completionString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "length"))
    v36 = 1;
  else
    v36 = v17;

  if (v36 == 1)
  {
    objc_msgSend(v48, "extensionString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICompletionStringView extensionLabel](self, "extensionLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setText:", v37);

    objc_msgSend(v48, "bridgeString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICompletionStringView bridgeLabel](self, "bridgeLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setText:", v39);

  }
  else
  {
    -[SearchUICompletionStringView extensionLabel](self, "extensionLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setText:", 0);

    -[SearchUICompletionStringView bridgeLabel](self, "bridgeLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", 0);
  }

  -[SearchUICompletionStringView extensionLabel](self, "extensionLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setHidden:", v36 ^ 1u);

  -[SearchUICompletionStringView bridgeLabel](self, "bridgeLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setHidden:", v36 ^ 1u);

  if (objc_msgSend((id)objc_opt_class(), "supportsImages"))
  {
    objc_msgSend(v48, "image");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", v44, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUICompletionStringView imageView](self, "imageView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v45)
    {
      objc_msgSend(v46, "updateWithImage:", v45);
    }
    else
    {
      objc_msgSend(v46, "updateWithImage:", 0);

      -[SearchUICompletionStringView imageView](self, "imageView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setHidden:", 1);
    }

  }
  -[SearchUICompletionStringView updateLabelStackVisibility](self, "updateLabelStackVisibility");
  v23 = v48;
LABEL_8:
  v49 = v23;
  -[SearchUICompletionStringView setCompletion:](self, "setCompletion:", v23);
  -[SearchUICompletionStringView superview](self, "superview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsLayout");

}

- (void)didUpdateWithImage:(id)a3
{
  void *v4;

  -[SearchUICompletionStringView imageView](self, "imageView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[SearchUICompletionStringView updateLabelStackVisibility](self, "updateLabelStackVisibility");
}

- (void)didFailToLoadImage
{
  void *v3;

  -[SearchUICompletionStringView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[SearchUICompletionStringView updateLabelStackVisibility](self, "updateLabelStackVisibility");
}

- (NSString)copyableString
{
  void *v2;
  void *v3;

  -[SearchUICompletionStringView completion](self, "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "copyableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  void *v2;
  char v3;

  -[SearchUICompletionStringView completion](self, "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "completionResultIsPotentiallyPunchout");

  return v3;
}

- (void)updateLabelStackVisibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[SearchUICompletionStringView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SearchUICompletionStringView imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SearchUICompletionStringView imageView](self, "imageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isHidden");

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 1;
  }

  -[SearchUICompletionStringView completionLabel](self, "completionLabel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alpha");
  v9 = v8;
  if (v8 == 0.0)
  {
    -[SearchUICompletionStringView extensionLabel](self, "extensionLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "isHidden") & v7;
  }
  else
  {
    v10 = 0;
  }
  -[SearchUICompletionStringView labelsStackView](self, "labelsStackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v10);

  if (v9 == 0.0)
}

- (BOOL)hasContent
{
  void *v2;
  BOOL v4;
  int v5;
  void *v6;

  v4 = -[SearchUICompletionStringView hasPrefix](self, "hasPrefix");
  if (!v4)
  {
    -[SearchUICompletionStringView extensionLabel](self, "extensionLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isHidden") & 1) != 0)
    {
      LOBYTE(v5) = 0;
LABEL_5:

      return v5;
    }
  }
  -[SearchUICompletionStringView labelsStackView](self, "labelsStackView");
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

  -[SearchUICompletionStringView completionLabel](self, "completionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  if (v4 == 0.0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    -[SearchUICompletionStringView labelsStackView](self, "labelsStackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHidden") ^ 1;

  }
  return v6;
}

- (NSString)completionText
{
  void *v3;
  void *v4;

  if (-[SearchUICompletionStringView hasPrefix](self, "hasPrefix"))
  {
    -[SearchUICompletionStringView completionLabel](self, "completionLabel");
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

  -[SearchUICompletionStringView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0.0;
  -[NUIContainerStackView spacing](self, "spacing");
  v6 = v5;
  -[SearchUICompletionStringView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v6 + v9;

  return v10;
}

- (SearchUICompletionStringModel)searchFieldModel
{
  return self->_searchFieldModel;
}

- (UIColor)selectionHighlightColor
{
  return self->_selectionHighlightColor;
}

- (BOOL)focusIsOnFirstResult
{
  return self->_focusIsOnFirstResult;
}

- (void)setFocusIsOnFirstResult:(BOOL)a3
{
  self->_focusIsOnFirstResult = a3;
}

- (SFSearchResult)result
{
  return (SFSearchResult *)objc_getProperty(self, a2, 736, 1);
}

- (void)setResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 736);
}

- (SearchUIImageView)imageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 744, 1);
}

- (void)setImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 744);
}

- (SearchUIMaskedLabelsStackView)labelsStackView
{
  return (SearchUIMaskedLabelsStackView *)objc_getProperty(self, a2, 752, 1);
}

- (void)setLabelsStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

- (SFCardSection)cardSection
{
  return (SFCardSection *)objc_getProperty(self, a2, 760, 1);
}

- (void)setCardSection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (SearchUICompletion)completion
{
  return (SearchUICompletion *)objc_getProperty(self, a2, 768, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
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
