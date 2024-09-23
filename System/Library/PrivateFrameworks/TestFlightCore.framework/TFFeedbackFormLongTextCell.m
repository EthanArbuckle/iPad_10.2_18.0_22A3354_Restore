@implementation TFFeedbackFormLongTextCell

- (TFFeedbackFormLongTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TFFeedbackFormLongTextCell *v4;
  id v5;
  uint64_t v6;
  UITextView *textView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TFFeedbackFormLongTextCell;
  v4 = -[TFFeedbackFormBaseCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6EF8]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    textView = v4->_textView;
    v4->_textView = (UITextView *)v6;

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_textView, "setBackgroundColor:", v8);

    -[UITextView setDelegate:](v4->_textView, "setDelegate:", v4);
    -[TFFeedbackFormLongTextCell traitCollection](v4, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TFFeedbackFormLongTextCell _createTextViewFontForTraitCollection:](TFFeedbackFormLongTextCell, "_createTextViewFontForTraitCollection:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v4->_textView, "setFont:", v10);

    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    -[UITextView textContainer](v4->_textView, "textContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLineFragmentPadding:", 0.0);

    -[UITextView textContainer](v4->_textView, "textContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLineBreakMode:", 0);

    -[UITextView setScrollEnabled:](v4->_textView, "setScrollEnabled:", 0);
    -[TFFeedbackFormLongTextCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_textView);

  }
  return v4;
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TFFeedbackFormLongTextCell;
  -[TFFeedbackFormBaseCell layoutSubviews](&v21, sel_layoutSubviews);
  -[TFFeedbackFormLongTextCell _updateCellHeightForTextIfNecessary](self, "_updateCellHeightForTextIfNecessary");
  +[TFFeedbackFormLongTextCell _textViewInsetsInTraitEnvironment:](TFFeedbackFormLongTextCell, "_textViewInsetsInTraitEnvironment:", self);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TFFeedbackFormLongTextCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v6 + v12;
  v15 = v4 + v14;
  v17 = v16 - (v6 + v10);
  v19 = v18 - (v4 + v8);

  -[TFFeedbackFormLongTextCell textView](self, "textView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

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
  -[TFFeedbackFormLongTextCell textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TFFeedbackFormLongTextCell _sizeToFitText:fittingSize:inTraitEnvironment:](TFFeedbackFormLongTextCell, "_sizeToFitText:fittingSize:inTraitEnvironment:", v7, self, width, height);
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
  v5.super_class = (Class)TFFeedbackFormLongTextCell;
  -[TFFeedbackFormLongTextCell traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[TFFeedbackFormLongTextCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormLongTextCell _prepareForDisplayWithTraitCollection:](self, "_prepareForDisplayWithTraitCollection:", v4);

  -[TFFeedbackFormLongTextCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TFFeedbackFormLongTextCell;
  -[TFFeedbackFormLongTextCell prepareForReuse](&v10, sel_prepareForReuse);
  -[TFFeedbackFormLongTextCell textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  if (v4)
  {
    -[TFFeedbackFormLongTextCell longTextEntry](self, "longTextEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TFFeedbackFormBaseCell updateProxy](self, "updateProxy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackFormLongTextCell longTextEntry](self, "longTextEntry");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackFormLongTextCell textView](self, "textView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didUpdateEntry:toString:editInProgress:", v7, v9, 0);

    }
  }
  -[TFFeedbackFormLongTextCell setLongTextEntry:](self, "setLongTextEntry:", 0);
}

- (void)applyContentsOfEntry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "type") == 1)
  {
    -[TFFeedbackFormLongTextCell setLongTextEntry:](self, "setLongTextEntry:", v4);
    objc_msgSend(MEMORY[0x24BDF6950], "placeholderTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BDD1458]);
    -[TFFeedbackFormLongTextCell longTextEntry](self, "longTextEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeholder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = *MEMORY[0x24BDF65F8];
    -[TFFeedbackFormLongTextCell textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = *MEMORY[0x24BDF6600];
    v15[0] = v10;
    v15[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v6, "initWithString:attributes:", v8, v11);
    -[TFFeedbackFormLongTextCell textView](self, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAttributedPlaceholder:", v12);

  }
}

+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a6;
  v13 = v11;
  v14 = a4;
  objc_msgSend(v13, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringForIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 || !objc_msgSend(v16, "length"))
  {
    objc_msgSend(v13, "placeholder");
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  objc_msgSend(a1, "_sizeToFitText:fittingSize:inTraitEnvironment:", v16, v12, width, height);
  v19 = v18;
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (unint64_t)displayableDataType
{
  return 0;
}

- (void)setDisplayedDataString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TFFeedbackFormLongTextCell textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return 1;
}

- (void)textViewDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[TFFeedbackFormLongTextCell longTextEntry](self, "longTextEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TFFeedbackFormBaseCell updateProxy](self, "updateProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackFormLongTextCell longTextEntry](self, "longTextEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didUpdateEntry:toString:editInProgress:", v6, v7, 0);

  }
}

+ (UIEdgeInsets)_textViewInsetsInTraitEnvironment:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  +[TFFeedbackFormViewSpecification formCellInsetsInTraitEnvironment:](TFFeedbackFormViewSpecification, "formCellInsetsInTraitEnvironment:", a3);
  UIEdgeInsetsAdd();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (CGSize)_sizeToFitText:(id)a3 fittingSize:(CGSize)a4 inTraitEnvironment:(id)a5
{
  double width;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  _QWORD v33[2];
  CGSize result;
  CGRect v35;

  width = a4.width;
  v33[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  +[TFFeedbackFormLongTextCell _textViewInsetsInTraitEnvironment:](TFFeedbackFormLongTextCell, "_textViewInsetsInTraitEnvironment:", v8);
  v11 = v10;
  v13 = v12;
  v16 = width - v14 - v15;
  objc_msgSend(v8, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_createTextViewFontForTraitCollection:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = *MEMORY[0x24BDF65F8];
  v33[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 3, v19, 0, v16, 1.79769313e308);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v35.origin.x = v21;
  v35.origin.y = v23;
  v35.size.width = v25;
  v35.size.height = v27;
  objc_msgSend(a1, "_adjustedTextViewHeightForCandidateHeight:font:", v18, CGRectGetHeight(v35));
  v29 = v28;

  v30 = ceil(v13 + v11 + v29);
  v31 = width;
  result.height = v30;
  result.width = v31;
  return result;
}

+ (double)_adjustedTextViewHeightForCandidateHeight:(double)a3 font:(id)a4
{
  double v5;
  double result;

  objc_msgSend(a4, "tf_computeFittedLineHeight");
  result = v5 * 3.0;
  if (result <= a3)
    return a3;
  return result;
}

- (void)_updateCellHeightForTextIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[TFFeedbackFormLongTextCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[TFFeedbackFormLongTextCell textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TFFeedbackFormLongTextCell _sizeToFitText:fittingSize:inTraitEnvironment:](TFFeedbackFormLongTextCell, "_sizeToFitText:fittingSize:inTraitEnvironment:", v8, self, v4, 1.79769313e308);
  v10 = v9;

  if (v6 != v10)
  {
    -[TFFeedbackFormBaseCell updateProxy](self, "updateProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackFormLongTextCell longTextEntry](self, "longTextEntry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackFormLongTextCell textView](self, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didUpdateEntry:toString:editInProgress:", v12, v14, 1);

    -[TFFeedbackFormLongTextCell setNeedsDisplay](self, "setNeedsDisplay");
    -[TFFeedbackFormLongTextCell _tableView](self, "_tableView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackFormLongTextCell _updateCellHeightForTextUpdatesInTableView:](self, "_updateCellHeightForTextUpdatesInTableView:", v15);

  }
}

- (void)_updateCellHeightForTextUpdatesInTableView:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x24BDF6F90];
  v4 = a3;
  v5 = objc_msgSend(v3, "areAnimationsEnabled");
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", 0);
  objc_msgSend(v4, "performBatchUpdates:completion:", &__block_literal_global_10, 0);

  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", v5);
}

- (void)_prepareForDisplayWithTraitCollection:(id)a3
{
  void *v4;
  id v5;

  +[TFFeedbackFormLongTextCell _createTextViewFontForTraitCollection:](TFFeedbackFormLongTextCell, "_createTextViewFontForTraitCollection:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormLongTextCell textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

}

+ (id)_createTextViewFontForTraitCollection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF77B0], a3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (TFFeedbackEntryLongText)longTextEntry
{
  return self->_longTextEntry;
}

- (void)setLongTextEntry:(id)a3
{
  objc_storeStrong((id *)&self->_longTextEntry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTextEntry, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
