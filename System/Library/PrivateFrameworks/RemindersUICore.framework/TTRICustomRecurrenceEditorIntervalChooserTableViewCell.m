@implementation TTRICustomRecurrenceEditorIntervalChooserTableViewCell

+ (NSNumberFormatter)numberFormatter
{
  if (numberFormatter_onceToken != -1)
    dispatch_once(&numberFormatter_onceToken, &__block_literal_global);
  return (NSNumberFormatter *)(id)numberFormatter__numberFormatter;
}

uint64_t __73__TTRICustomRecurrenceEditorIntervalChooserTableViewCell_numberFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)numberFormatter__numberFormatter;
  numberFormatter__numberFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)numberFormatter__numberFormatter, "setMinimum:", v2);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 999);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)numberFormatter__numberFormatter, "setMaximum:", v3);

  objc_msgSend((id)numberFormatter__numberFormatter, "setMinimumIntegerDigits:", 1);
  objc_msgSend((id)numberFormatter__numberFormatter, "setMaximumIntegerDigits:", 6);
  objc_msgSend((id)numberFormatter__numberFormatter, "setMaximumFractionDigits:", 0);
  return objc_msgSend((id)numberFormatter__numberFormatter, "setRoundingMode:", 1);
}

- (TTRICustomRecurrenceEditorIntervalChooserTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TTRICustomRecurrenceEditorIntervalChooserTableViewCell *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TTRICustomRecurrenceEditorIntervalChooserTableViewCell;
  v4 = -[TTRIPopupMenuTableViewCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3E50]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v6, "setKeyboardType:", 8);
    -[TTRIPopupMenuTableViewCell titleLabel](v4, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v10);

    objc_msgSend(v6, "setClipsToBounds:", 1);
    objc_msgSend(v6, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 4.0);

    objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v6, "textContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWidthTracksTextView:", 1);

    objc_msgSend(v6, "textContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLineFragmentPadding:", 0.0);

    objc_msgSend(v6, "setTextContainerInset:", 0.0, 8.0, 0.0, 8.0);
    objc_msgSend(v6, "setTextAlignment:", 1);
    objc_msgSend(v6, "setScrollEnabled:", 0);
    objc_msgSend(v6, "textContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMaximumNumberOfLines:", 1);

    objc_msgSend(v6, "setDelegate:", v4);
    -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell setIntervalChooserTextView:](v4, "setIntervalChooserTextView:", v6);
    LODWORD(v15) = 1148829696;
    objc_msgSend(v6, "setLayoutSize:withContentPriority:", *MEMORY[0x1E0CFAA88], *(double *)(MEMORY[0x1E0CFAA88] + 8), v15);
    -[TTRIPopupMenuTableViewCell accessoriesStackView](v4, "accessoriesStackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertArrangedSubview:atIndex:", v6, 0);

  }
  return v4;
}

- (void)setIntervalValue:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell intervalChooserTextView](self, "intervalChooserTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell intervalChooserTextView](self, "intervalChooserTextView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateIntrinsicContentSize");

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell intervalChooserTextView](self, "intervalChooserTextView");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v9)
  {
    objc_msgSend(v9, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v14, "replaceCharactersInRange:withString:", location, length, v10);
    if (objc_msgSend(v14, "containsString:", CFSTR("\n")))
      objc_msgSend(v9, "resignFirstResponder");
    if (objc_msgSend(v14, "length"))
    {
      +[TTRICustomRecurrenceEditorIntervalChooserTableViewCell numberFormatter](TTRICustomRecurrenceEditorIntervalChooserTableViewCell, "numberFormatter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberFromString:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        +[TTRICustomRecurrenceEditorIntervalChooserTableViewCell numberFormatter](TTRICustomRecurrenceEditorIntervalChooserTableViewCell, "numberFormatter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringFromNumber:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v14, "isEqualToString:", v18);
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell intervalChooserTextView](self, "intervalChooserTextView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[TTRIPopupMenuTableViewCell accessoriesStackView](self, "accessoriesStackView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateIntrinsicContentSize");

  }
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell intervalChooserTextView](self, "intervalChooserTextView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell intervalChooserTextView](self, "intervalChooserTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", &unk_1E67F41F0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "length"))
    {
      v8 = v7;

      -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell intervalChooserTextView](self, "intervalChooserTextView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);

      v15 = v8;
    }
    +[TTRICustomRecurrenceEditorIntervalChooserTableViewCell numberFormatter](TTRICustomRecurrenceEditorIntervalChooserTableViewCell, "numberFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberFromString:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "intervalChooserDidUpdateValue:", (int)objc_msgSend(v11, "intValue"));

      -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell intervalChooserTextView](self, "intervalChooserTextView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "invalidateIntrinsicContentSize");
    }
    else
    {
      -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell intervalChooserTextView](self, "intervalChooserTextView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v7);

      -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "intervalChooserDidUpdateValue:", 1);
    }

  }
}

- (TTRICustomRecurrenceEditorIntervalChooserTableViewCellDelegate)delegate
{
  return (TTRICustomRecurrenceEditorIntervalChooserTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITextView)intervalChooserTextView
{
  return self->_intervalChooserTextView;
}

- (void)setIntervalChooserTextView:(id)a3
{
  objc_storeStrong((id *)&self->_intervalChooserTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalChooserTextView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
