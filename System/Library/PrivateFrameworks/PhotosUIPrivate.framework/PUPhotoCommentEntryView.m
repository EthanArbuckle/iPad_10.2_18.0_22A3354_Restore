@implementation PUPhotoCommentEntryView

- (PUPhotoCommentEntryView)initWithFrame:(CGRect)a3
{
  PUPhotoCommentEntryView *v3;
  uint64_t v4;
  UIButton *postButton;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  UITextView *textView;
  UITextView *v18;
  void *v19;
  UITextView *v20;
  void *v21;
  UITextView *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UILabel *placeholderLabel;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  void *v33;
  UILabel *v34;
  void *v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)PUPhotoCommentEntryView;
  v3 = -[PUPhotoCommentEntryView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    postButton = v3->_postButton;
    v3->_postButton = (UIButton *)v4;

    v6 = v3->_postButton;
    PLLocalizedFrameworkString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v6, "setTitle:forState:", v7, 0);

    -[UIButton titleLabel](v3->_postButton, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D714A8], "sharedCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "commentSendButtonFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v10);

    -[UIButton sizeToFit](v3->_postButton, "sizeToFit");
    -[UIButton setHidden:](v3->_postButton, "setHidden:", 1);
    -[UIButton layoutIfNeeded](v3->_postButton, "layoutIfNeeded");
    v11 = objc_alloc(MEMORY[0x1E0DC3E50]);
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
    textView = v3->_textView;
    v3->_textView = (UITextView *)v16;

    -[UITextView setDelegate:](v3->_textView, "setDelegate:", v3);
    v18 = v3->_textView;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v18, "setTextColor:", v19);

    v20 = v3->_textView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    v22 = v3->_textView;
    objc_msgSend(MEMORY[0x1E0D714A8], "sharedCache");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "commentEntryFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v22, "setFont:", v24);

    -[UITextView sizeToFit](v3->_textView, "sizeToFit");
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v12, v13, v14, v15);
    placeholderLabel = v3->_placeholderLabel;
    v3->_placeholderLabel = (UILabel *)v25;

    v27 = v3->_placeholderLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "placeholderTextColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v27, "setTextColor:", v28);

    v29 = v3->_placeholderLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v29, "setBackgroundColor:", v30);

    v31 = v3->_placeholderLabel;
    objc_msgSend(MEMORY[0x1E0D714A8], "sharedCache");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "commentEntryFont");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v31, "setFont:", v33);

    v34 = v3->_placeholderLabel;
    PLLocalizedFrameworkString();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v34, "setText:", v35);

    -[UILabel sizeToFit](v3->_placeholderLabel, "sizeToFit");
    -[PUPhotoCommentEntryView addSubview:](v3, "addSubview:", v3->_placeholderLabel);
    -[PUPhotoCommentEntryView addSubview:](v3, "addSubview:", v3->_textView);
    -[UITextView setScrollsToTop:](v3->_textView, "setScrollsToTop:", 0);
    -[PUPhotoCommentEntryView addSubview:](v3, "addSubview:", v3->_postButton);
    -[PUPhotoCommentEntryView clearText](v3, "clearText");
  }
  return v3;
}

- (double)preferredHeight
{
  void *v3;
  void *v4;
  double v5;
  double result;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;

  -[UITextView layoutManager](self->_textView, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView textContainer](self->_textView, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureLayoutForTextContainer:", v4);

  -[UITextView layoutIfNeeded](self->_textView, "layoutIfNeeded");
  -[UITextView contentSize](self->_textView, "contentSize");
  if (v5 < 0.0)
    return 44.0;
  v7 = v5 + 1.0 + 6.0 + 3.0;
  result = 44.0;
  if (v7 >= 44.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == 1)
    {
      v10 = 80.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "statusBarOrientation") - 1;

      if (v12 >= 2)
        v10 = 40.0;
      else
        v10 = 60.0;
    }
    -[UITextView textContainerInset](self->_textView, "textContainerInset");
    result = v14 + v10 + v13 + 1.0 + 6.0 + 3.0;
    if (v7 <= result)
      return v7;
  }
  return result;
}

- (void)clearText
{
  -[UITextView setText:](self->_textView, "setText:", 0);
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", 0);
  -[UIButton setEnabled:](self->_postButton, "setEnabled:", 0);
}

- (void)setText:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[UITextView setText:](self->_textView, "setText:", v4);
    -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", 1);
    -[UIButton setEnabled:](self->_postButton, "setEnabled:", 1);
  }

}

- (id)trimmedText
{
  void *v2;
  void *v3;
  void *v4;

  -[UITextView text](self->_textView, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
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
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double MaxX;
  double v32;
  void *v33;
  NSString *v34;
  _BOOL4 IsAccessibilityCategory;
  UIButton *postButton;
  double v37;
  double v38;
  double v39;
  id v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[PUPhotoCommentEntryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUPhotoCommentEntryView semanticContentAttribute](self, "semanticContentAttribute"));
  -[UITextView textContainerInset](self->_textView, "textContainerInset");
  v39 = v12;
  -[UIButton frame](self->_postButton, "frame");
  v14 = v13;
  v16 = v15;
  if (v11)
    v17 = 15.0;
  else
    v17 = v8 - v13 + -15.0;
  -[UIButton titleLabel](self->_postButton, "titleLabel");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_lastLineBaseline");
  -[UIButton convertPoint:fromView:](self->_postButton, "convertPoint:fromView:", v40, 0.0, v18);
  -[UIButton setFrame:](self->_postButton, "setFrame:", v17, v10 - v16 + -22.0 + v16 - v19, v14, v16);
  -[UIButton layoutIfNeeded](self->_postButton, "layoutIfNeeded");
  v20 = v8 + -10.0 - v14 + -5.0 + -15.0;
  v21 = v10 + -1.0 + -6.0 + -3.0;
  if (v11)
  {
    v41.origin.x = v4;
    v41.origin.y = v6;
    v41.size.width = v8;
    v41.size.height = v10;
    v22 = CGRectGetMaxX(v41) - v20 + -10.0;
  }
  else
  {
    v22 = 10.0;
  }
  -[UITextView setFrame:](self->_textView, "setFrame:", v22, 7.0, v20, v21);
  -[UILabel frame](self->_placeholderLabel, "frame");
  v24 = v23;
  v26 = v25;
  -[UITextView frame](self->_textView, "frame");
  v28 = v27;
  v30 = v29;
  if (v11)
  {
    v42.origin.y = 7.0;
    v42.origin.x = v22;
    v42.size.width = v20;
    v42.size.height = v21;
    MaxX = CGRectGetMaxX(v42);
    v43.origin.x = v28;
    v43.origin.y = v30;
    v43.size.width = v24;
    v43.size.height = v26;
    v32 = MaxX - CGRectGetWidth(v43) + -5.0;
  }
  else
  {
    v32 = v27 + 5.0;
  }
  -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v32, v39 + v30, v24, v26);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "preferredContentSizeCategory");
  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v34);

  if (IsAccessibilityCategory)
  {
    postButton = self->_postButton;
    -[UIButton center](postButton, "center");
    v38 = v37;
    -[UILabel center](self->_placeholderLabel, "center");
    -[UIButton setCenter:](postButton, "setCenter:", v38);
  }

}

- (void)textViewDidChange:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  id v10;

  -[PUPhotoCommentEntryView trimmedText](self, "trimmedText", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v10, "length") != 0;
  v5 = -[UITextView hasText](self->_textView, "hasText");
  -[UIButton setEnabled:](self->_postButton, "setEnabled:", v4);
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", v5);
  -[PUPhotoCommentEntryView frame](self, "frame");
  v7 = v6;
  -[PUPhotoCommentEntryView preferredHeight](self, "preferredHeight");
  if (v7 != v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "photoCommentEntryViewHeightDidChange:", self);

  }
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id WeakRetained;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  UILabel *placeholderLabel;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "photoCommentEntryViewWillBeginEditing:", self);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    placeholderLabel = self->_placeholderLabel;
    -[UILabel frame](placeholderLabel, "frame");
    v10 = v9;
    -[UILabel frame](self->_placeholderLabel, "frame");
    v12 = v11;
    -[UITextView frame](self->_textView, "frame");
    v14 = v13;
    -[UILabel frame](self->_placeholderLabel, "frame");
    -[UILabel setFrame:](placeholderLabel, "setFrame:", v10, v12, v14);
  }
  return 1;
}

- (BOOL)textViewShouldEndEditing:(id)a3
{
  PUPhotoCommentEntryViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  char v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 1;
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_msgSend(v7, "photoCommentEntryViewShouldEndEditing:", self);

  return v8;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[UIButton setHidden:](self->_postButton, "setHidden:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "photoCommentEntryViewDidBeginEditing:", self);

  }
}

- (void)textViewDidEndEditing:(id)a3
{
  id WeakRetained;

  -[UIButton setHidden:](self->_postButton, "setHidden:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "photoCommentEntryViewDidEndEditing:", self);

}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (UITextView)textView
{
  return self->_textView;
}

- (UIButton)postButton
{
  return self->_postButton;
}

- (PUPhotoCommentEntryViewDelegate)delegate
{
  return (PUPhotoCommentEntryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_postButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->placeholderLabel, 0);
}

@end
