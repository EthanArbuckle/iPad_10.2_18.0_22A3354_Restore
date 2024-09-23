@implementation PKMemoIconCell

- (void)showEmojiKeyboardIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC4F38]) & 1) == 0)
    -[UITextView resignFirstResponder](self->_emojiTextView, "resignFirstResponder");
  -[UITextView becomeFirstResponder](self->_emojiTextView, "becomeFirstResponder");

}

- (void)setItem:(id)a3
{
  PKMemoItem **p_item;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UILabel *emojiLabel;
  UITextView *emojiTextView;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *v16;
  UILabel *v17;
  UITextView *v18;
  UILabel *v19;
  UITextView *v20;
  UITextView *v21;
  UITextView *v22;
  UITextView *v23;
  void *v24;
  UITextView *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  p_item = &self->_item;
  objc_storeStrong((id *)&self->_item, a3);
  v6 = -[PKMemoItem type](self->_item, "type");
  switch(v6)
  {
    case 0uLL:
    case 3uLL:
      -[PKMemoItem memo](*p_item, "memo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "emoji");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (!v9)
      {
        -[UILabel removeFromSuperview](self->_emojiLabel, "removeFromSuperview");
        emojiLabel = self->_emojiLabel;
        self->_emojiLabel = 0;

      }
      -[UITextView removeFromSuperview](self->_emojiTextView, "removeFromSuperview");
      emojiTextView = self->_emojiTextView;
      self->_emojiTextView = 0;

      goto LABEL_5;
    case 1uLL:
      -[UILabel removeFromSuperview](self->_emojiLabel, "removeFromSuperview");
      v17 = self->_emojiLabel;
      self->_emojiLabel = 0;

      -[UITextView removeFromSuperview](self->_emojiTextView, "removeFromSuperview");
      v18 = self->_emojiTextView;
      self->_emojiTextView = 0;

      -[PKMemoIconCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 2uLL:
      -[UILabel removeFromSuperview](self->_emojiLabel, "removeFromSuperview");
      v19 = self->_emojiLabel;
      self->_emojiLabel = 0;

      -[PKMemoIconCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    default:
LABEL_5:
      -[PKMemoIconCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == 3)
        goto LABEL_8;
      if (v6 == 2)
      {
LABEL_14:
        v20 = self->_emojiTextView;
        if (!v20)
        {
          v21 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
          v22 = self->_emojiTextView;
          self->_emojiTextView = v21;

          v23 = self->_emojiTextView;
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextView setTintColor:](v23, "setTintColor:", v24);

          v25 = self->_emojiTextView;
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextView setBackgroundColor:](v25, "setBackgroundColor:", v26);

          -[UITextView setScrollEnabled:](self->_emojiTextView, "setScrollEnabled:", 0);
          -[UITextView setTextAlignment:](self->_emojiTextView, "setTextAlignment:", 1);
          -[UITextView setDelegate:](self->_emojiTextView, "setDelegate:", self);
          -[UITextView setKeyboardType:](self->_emojiTextView, "setKeyboardType:", 124);
          -[UITextView setAutocorrectionType:](self->_emojiTextView, "setAutocorrectionType:", 1);
          objc_msgSend(v12, "addSubview:", self->_emojiTextView);
          v20 = self->_emojiTextView;
        }
        -[PKMemoItem memo](*p_item, "memo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "emoji");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextView setText:](v20, "setText:", v27);

      }
      else
      {
        if (v6)
          goto LABEL_18;
LABEL_8:
        -[PKMemoItem memo](*p_item, "memo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "emoji");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!self->_emojiLabel && objc_msgSend(v14, "length"))
        {
          v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
          v16 = self->_emojiLabel;
          self->_emojiLabel = v15;

          -[UILabel setTextAlignment:](self->_emojiLabel, "setTextAlignment:", 1);
          objc_msgSend(v12, "addSubview:", self->_emojiLabel);
        }
        -[UILabel setText:](self->_emojiLabel, "setText:", v14);
      }

LABEL_18:
      -[PKMemoIconCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");

      return;
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v6;
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
  unint64_t v18;
  UILabel *emojiLabel;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  objc_super v45;
  void *v46;
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)PKMemoIconCell;
  -[PKMemoIconCell layoutSubviews](&v45, sel_layoutSubviews);
  -[PKMemoIconCell bounds](self, "bounds");
  if (v3 != self->_priorBoundsSize.width || v4 != self->_priorBoundsSize.height)
  {
    self->_priorBoundsSize.width = v3;
    self->_priorBoundsSize.height = v4;
    -[PKMemoIconCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
  -[PKMemoIconCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  PKSizeAlignedInRect();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = v8 * 0.55;
  v18 = -[PKMemoItem type](self->_item, "type");
  switch(v18)
  {
    case 3uLL:
      goto LABEL_9;
    case 2uLL:
      -[UITextView setFrame:](self->_emojiTextView, "setFrame:", v10, v12, v14, v16);
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "currentInputMode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isDefaultRightToLeft");

      v25 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
      -[UITextView text](self->_emojiTextView, "text");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v28 = v27;
      v30 = v29;
      v31 = *MEMORY[0x1E0DC1258];
      v47[0] = *MEMORY[0x1E0DC1138];
      v47[1] = v31;
      v48[0] = v21;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "boundingRectWithSize:options:attributes:context:", 33, v34, v25, v28, v30);
      v36 = v35;

      -[UITextView contentOffset](self->_emojiTextView, "contentOffset");
      v38 = v37;
      -[UITextView textContainer](self->_emojiTextView, "textContainer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "size");
      v41 = v40;
      -[UITextView zoomScale](self->_emojiTextView, "zoomScale");
      v43 = (v41 - v36 * v42) * 0.5;

      v44 = 0.0;
      if (v43 >= 0.0)
        v44 = v43;
      -[UITextView setContentOffset:](self->_emojiTextView, "setContentOffset:", v38, -v44);
      -[UITextView setFont:](self->_emojiTextView, "setFont:", v21);

      break;
    case 0uLL:
LABEL_9:
      emojiLabel = self->_emojiLabel;
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](emojiLabel, "setFont:", v20);

      -[UILabel setFrame:](self->_emojiLabel, "setFrame:", v10, v12, v14, v16);
      break;
  }

}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  double height;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)PKMemoIconCell;
  -[PKMemoIconCell updateConfigurationUsingState:](&v29, sel_updateConfigurationUsingState_, a3);
  -[PKMemoIconCell backgroundConfiguration](self, "backgroundConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PKMemoIconCell defaultBackgroundConfiguration](self, "defaultBackgroundConfiguration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[PKMemoItem memo](self->_item, "memo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "color");
  objc_msgSend(v7, "setCornerRadius:", 10.0);
  if (v9)
    PKPeerPaymentMessageColorFromSemanticColor(v9);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v10);

  v11 = 0;
  v12 = -[PKMemoItem type](self->_item, "type");
  switch(v12)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setStrokeColor:", v16);

      objc_msgSend(v7, "setStrokeOutset:", 1.0);
      v11 = 0;
      break;
    case 1uLL:
    case 3uLL:
      -[PKMemoItem memo](self->_item, "memo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "emoji");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v15)
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", self->_priorBoundsSize.height * 0.6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "configurationWithPaletteColors:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "configurationByApplyingConfiguration:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == 1)
          v23 = CFSTR("plus");
        else
          v23 = CFSTR("emoji.face.grinning");
        objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v23, v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setImageContentMode:", 4);

      }
      goto LABEL_15;
    case 2uLL:
LABEL_15:
      objc_msgSend(v7, "setStrokeWidth:", 0.0);
      break;
    default:
      break;
  }
  objc_msgSend(v7, "setImage:", v11);
  height = self->_priorBoundsSize.height;
  if (self->_priorBoundsSize.width == height)
  {
    v26 = *MEMORY[0x1E0DC3298];
    v25 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v27 = *(double *)(MEMORY[0x1E0DC3298] + 16);
    v28 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  }
  else
  {
    v25 = (self->_priorBoundsSize.width - height) * 0.5;
    v26 = 0.0;
    v27 = 0.0;
    v28 = v25;
  }
  objc_msgSend(v7, "setBackgroundInsets:", v26, v25, v27, v28);
  -[PKMemoIconCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v7);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PKMemoIconCellDelegate **p_delegate;
  id v15;
  BOOL v16;
  id v17;
  void *v19;
  id WeakRetained;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length") && !CEMStringIsSingleEmoji())
  {
    if (!CEMStringIsSingleEmoji())
    {
      v16 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v9, "setText:", v10);
    -[PKMemoItem memo](self->_item, "memo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEmoji:", v10);

    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    v16 = 0;
    if (WeakRetained)
      goto LABEL_4;
  }
  else
  {
    -[PKMemoItem memo](self->_item, "memo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEmoji:", v12);

    p_delegate = &self->_delegate;
    v15 = objc_loadWeakRetained((id *)&self->_delegate);

    v16 = 1;
    if (v15)
    {
LABEL_4:
      v17 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v17, "cell:didUpdateText:", self, v12);

    }
  }
  -[PKMemoIconCell setNeedsLayout](self, "setNeedsLayout");
LABEL_6:

  return v16;
}

- (PKMemoItem)item
{
  return self->_item;
}

- (PKMemoIconCellDelegate)delegate
{
  return (PKMemoIconCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_emojiTextView, 0);
  objc_storeStrong((id *)&self->_emojiLabel, 0);
}

@end
