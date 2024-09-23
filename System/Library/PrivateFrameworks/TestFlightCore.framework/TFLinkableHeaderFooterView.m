@implementation TFLinkableHeaderFooterView

- (TFLinkableHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  TFLinkableHeaderFooterView *v3;
  id v4;
  uint64_t v5;
  UITextView *textView;
  UITextView *v7;
  void *v8;
  void *v9;
  void *v10;
  UITextView *v11;
  void *v12;
  UITextView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TFLinkableHeaderFooterView;
  v3 = -[TFLinkableHeaderFooterView initWithReuseIdentifier:](&v19, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6EF8]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    textView = v3->_textView;
    v3->_textView = (UITextView *)v5;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v3->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = v3->_textView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UITextView setEditable:](v3->_textView, "setEditable:", 0);
    -[UITextView setSelectable:](v3->_textView, "setSelectable:", 1);
    -[UITextView setScrollEnabled:](v3->_textView, "setScrollEnabled:", 0);
    -[UITextView setTextContainerInset:](v3->_textView, "setTextContainerInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    -[UITextView textContainer](v3->_textView, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

    -[UITextView setInsetsLayoutMarginsFromSafeArea:](v3->_textView, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[UITextView textContainer](v3->_textView, "textContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLineBreakMode:", 0);

    v11 = v3->_textView;
    +[TFLinkableHeaderFooterViewSpecification textViewFontColor](TFLinkableHeaderFooterViewSpecification, "textViewFontColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v11, "setTextColor:", v12);

    v13 = v3->_textView;
    -[TFLinkableHeaderFooterView traitCollection](v3, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TFLinkableHeaderFooterViewSpecification createTextViewFontForTraitCollection:](TFLinkableHeaderFooterViewSpecification, "createTextViewFontForTraitCollection:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v13, "setFont:", v15);

    -[UITextView _setInteractiveTextSelectionDisabled:](v3->_textView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView textDragInteraction](v3->_textView, "textDragInteraction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEnabled:", 0);

    -[TFLinkableHeaderFooterView contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v3->_textView);

  }
  return v3;
}

- (TFLinkableHeaderFooterView)init
{
  return -[TFLinkableHeaderFooterView initWithReuseIdentifier:](self, "initWithReuseIdentifier:", CFSTR("TFLinkableHeaderFooterView"));
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double MinX;
  double Width;
  void *v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v34.receiver = self;
  v34.super_class = (Class)TFLinkableHeaderFooterView;
  -[TFLinkableHeaderFooterView layoutSubviews](&v34, sel_layoutSubviews);
  +[TFFeedbackFormViewSpecification formCellInsetsInTraitEnvironment:](TFFeedbackFormViewSpecification, "formCellInsetsInTraitEnvironment:", self);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TFLinkableHeaderFooterView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v6 + v12;
  v15 = v4 + v14;
  v17 = v16 - (v6 + v10);
  v19 = v18 - (v4 + v8);

  -[TFLinkableHeaderFooterView textView](self, "textView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[TFLinkableHeaderFooterViewSpecification topPaddingFromFirstBaselineForShowingHeader:](TFLinkableHeaderFooterViewSpecification, "topPaddingFromFirstBaselineForShowingHeader:", -[TFLinkableHeaderFooterView isHeader](self, "isHeader"));
  objc_msgSend(v21, "_scaledValueForValue:");
  v23 = v22;

  -[TFLinkableHeaderFooterView textView](self, "textView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "tf_estimatedFirstBaseline");
  v26 = v25;

  v35.origin.x = v13;
  v35.origin.y = v15;
  v35.size.width = v17;
  v35.size.height = v19;
  v27 = v23 - v26 + CGRectGetMinY(v35);
  -[TFLinkableHeaderFooterView textView](self, "textView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sizeThatFits:", v17, v19);
  v30 = v29;

  v36.origin.x = v13;
  v36.origin.y = v15;
  v36.size.width = v17;
  v36.size.height = v19;
  MinX = CGRectGetMinX(v36);
  v37.origin.x = v13;
  v37.origin.y = v15;
  v37.size.width = v17;
  v37.size.height = v19;
  Width = CGRectGetWidth(v37);
  -[TFLinkableHeaderFooterView textView](self, "textView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", MinX, v27, Width, v30);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TFLinkableHeaderFooterView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TFLinkableHeaderFooterView itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:](TFLinkableHeaderFooterView, "itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:", v7, -[TFLinkableHeaderFooterView isHeader](self, "isHeader"), self, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TFLinkableHeaderFooterView;
  -[TFLinkableHeaderFooterView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[TFLinkableHeaderFooterView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFLinkableHeaderFooterView _prepareForDisplayWithTraitCollection:](self, "_prepareForDisplayWithTraitCollection:", v4);

  -[TFLinkableHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)applyText:(id)a3 withTextLinkMap:(id)a4 isHeader:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[TFLinkableHeaderFooterView textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  -[TFLinkableHeaderFooterView _updateTextViewWithLinkMap:](self, "_updateTextViewWithLinkMap:", v8);
  -[TFLinkableHeaderFooterView setIsHeader:](self, "setIsHeader:", v5);
  -[TFLinkableHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
}

+ (CGSize)itemSizeWithText:(id)a3 isHeader:(BOOL)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6
{
  double width;
  _BOOL8 v7;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  width = a5.width;
  v7 = a4;
  v10 = a6;
  v11 = a3;
  +[TFFeedbackFormViewSpecification formCellInsetsInTraitEnvironment:](TFFeedbackFormViewSpecification, "formCellInsetsInTraitEnvironment:", v10);
  v14 = width - v12 - v13;
  objc_msgSend(v10, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[TFLinkableHeaderFooterViewSpecification createTextViewFontForTraitCollection:](TFLinkableHeaderFooterViewSpecification, "createTextViewFontForTraitCollection:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_heightForTextViewWithText:font:isHeader:fittingWidth:inTraitEnvironment:", v11, v16, v7, v10, v14);
  v18 = v17;

  +[TFLinkableHeaderFooterViewSpecification topPaddingFromFirstBaselineForShowingHeader:](TFLinkableHeaderFooterViewSpecification, "topPaddingFromFirstBaselineForShowingHeader:", v7);
  objc_msgSend(v16, "_scaledValueForValue:");
  v20 = v19;
  +[TFLinkableHeaderFooterViewSpecification bottomPaddingForShowingHeader:](TFLinkableHeaderFooterViewSpecification, "bottomPaddingForShowingHeader:", v7);
  objc_msgSend(v16, "_scaledValueForValue:");
  v22 = v21;
  objc_msgSend(v16, "tf_estimatedFirstBaseline");
  v24 = v22 + v18 + v20 - v23;

  v25 = width;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

+ (double)_heightForTextViewWithText:(id)a3 font:(id)a4 isHeader:(BOOL)a5 fittingWidth:(double)a6 inTraitEnvironment:(id)a7
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  uint64_t v22;
  _QWORD v23[2];
  CGRect v24;

  v23[1] = *MEMORY[0x24BDAC8D0];
  v22 = *MEMORY[0x24BDF65F8];
  v23[0] = a4;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 3, v12, 0, a6, 1.79769313e308);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v24.origin.x = v14;
  v24.origin.y = v16;
  v24.size.width = v18;
  v24.size.height = v20;
  return CGRectGetHeight(v24);
}

- (void)_updateTextViewWithLinkMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[TFLinkableHeaderFooterView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v33[0] = *MEMORY[0x24BDF65F8];
      -[TFLinkableHeaderFooterView textView](self, "textView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v8;
      v33[1] = *MEMORY[0x24BDF6600];
      -[TFLinkableHeaderFooterView textView](self, "textView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v11 = objc_claimAutoreleasedReturnValue();

      v12 = objc_alloc(MEMORY[0x24BDD1688]);
      -[TFLinkableHeaderFooterView textView](self, "textView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)v11;
      v15 = (void *)objc_msgSend(v12, "initWithString:attributes:", v14, v11);

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v16 = v4;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v29;
        v20 = *MEMORY[0x24BDF6618];
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v16, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v22, "rangeValue");
            objc_msgSend(v15, "addAttribute:value:range:", v20, v23, v24, v25);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v18);
      }

      -[TFLinkableHeaderFooterView textView](self, "textView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAttributedText:", v15);

      -[TFLinkableHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)_prepareForDisplayWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TFLinkableHeaderFooterView textView](self, "textView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[TFLinkableHeaderFooterViewSpecification createTextViewFontForTraitCollection:](TFLinkableHeaderFooterViewSpecification, "createTextViewFontForTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFont:", v5);
}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("TFLinkableHeaderFooterView");
}

- (UITextView)textView
{
  return self->_textView;
}

- (BOOL)isHeader
{
  return self->_isHeader;
}

- (void)setIsHeader:(BOOL)a3
{
  self->_isHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
