@implementation PSTextViewTableCell

- (PSTextViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id *v8;
  PSTextViewTableCell *v9;
  PSTextViewTableCell *v10;
  PSTextView *v11;
  PSTextView *v12;
  void *v13;
  id WeakRetained;
  char v15;
  void *v16;
  id v17;
  objc_super v19;

  v8 = (id *)a5;
  v19.receiver = self;
  v19.super_class = (Class)PSTextViewTableCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v19, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[PSTextViewTableCell setSelectionStyle:](v9, "setSelectionStyle:", 0);
    -[PSTextViewTableCell setAccessoryType:](v10, "setAccessoryType:", 0);
    v11 = [PSTextView alloc];
    v12 = -[UITextContentView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PSTextView setCell:](v12, "setCell:", v10);
    -[PSTextView setTextLoupeVisibility:](v12, "setTextLoupeVisibility:", 1);
    UISystemFontForSize();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextContentView setFont:](v12, "setFont:", v13);

    -[PSTextViewTableCell setTextView:](v10, "setTextView:", v12);
    if (v8[2])
    {
      WeakRetained = objc_loadWeakRetained(v8 + 1);
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        objc_msgSend(v8, "performGetter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSTextViewTableCell setValue:](v10, "setValue:", v16);

      }
    }
    if (v8[3] && v8[2])
    {
      v17 = objc_loadWeakRetained(v8 + 1);
      -[PSTableCell setValueChangedTarget:action:specifier:](v10, "setValueChangedTarget:action:specifier:", v17, v8[3], v8);

    }
  }

  return v10;
}

- (void)setValue:(id)a3
{
  -[UITextContentView setContentToHTMLString:](self->_textView, "setContentToHTMLString:", a3);
  -[PSTextViewTableCell setNeedsLayout](self, "setNeedsLayout");
  -[PSTextViewTableCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)cellRemovedFromView
{
  void *v3;
  BOOL v4;
  objc_super v5;

  -[PSTableCell specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)PSTextViewTableCell;
  -[PSTableCell cellRemovedFromView](&v5, sel_cellRemovedFromView);
  if (-[UITextContentView isEditing](self->_textView, "isEditing"))
    v4 = v3 == 0;
  else
    v4 = 1;
  if (!v4)
    -[PSTableCell setSpecifier:](self, "setSpecifier:", v3);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSTextViewTableCell;
  -[PSTableCell layoutSubviews](&v5, sel_layoutSubviews);
  -[PSTextViewTableCell textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTextViewTableCell _adjustTextView:updateTable:withSpecifier:](self, "_adjustTextView:updateTable:withSpecifier:", v3, 1, v4);

}

- (void)_adjustTextView:(id)a3 updateTable:(BOOL)a4 withSpecifier:(id)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  float v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  CGRect v26;

  v6 = a4;
  v25 = a3;
  v7 = a5;
  objc_msgSend(v7, "propertyForKey:", CFSTR("textViewBottomMargin"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (id)objc_msgSend(v25, "text");
    v10 = PSTextViewInsets();
    v12 = v11;
    objc_msgSend(v25, "webView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v14 = v12 + v10 + CGRectGetHeight(v26);
    objc_msgSend(v8, "floatValue");
    v16 = v14 + v15;

    *(float *)&v17 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "propertyForKey:", CFSTR("height"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
    {
      if (v6)
      {
        objc_msgSend(v7, "target");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "target");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "table");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v23 = 0;
        }

        v24 = objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled");
        objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", 0);
        objc_msgSend(v23, "beginUpdates");
        objc_msgSend(v7, "setProperty:forKey:", v18, CFSTR("height"));
        objc_msgSend(v23, "endUpdates");
        objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", v24);

      }
      else
      {
        objc_msgSend(v7, "setProperty:forKey:", v18, CFSTR("height"));
      }
    }

  }
}

- (void)textContentViewDidEndEditing:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  -[PSTableCell cellTarget](self, "cellTarget");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PSTableCell specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PSTableCell cellAction](self, "cellAction");
      -[PSTableCell cellTarget](self, "cellTarget");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contentAsHTMLString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell specifier](self, "specifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)SFPerformSelector2();

    }
  }

}

- (BOOL)becomeFirstResponder
{
  return -[UITextContentView becomeFirstResponder](self->_textView, "becomeFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return -[UITextContentView canBecomeFirstResponder](self->_textView, "canBecomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSTextViewTableCell;
  if (!-[PSTextViewTableCell isFirstResponder](&v5, sel_isFirstResponder))
    return -[UITextContentView resignFirstResponder](self->_textView, "resignFirstResponder");
  v4.receiver = self;
  v4.super_class = (Class)PSTextViewTableCell;
  return -[PSTextViewTableCell resignFirstResponder](&v4, sel_resignFirstResponder);
}

- (PSTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  PSTextView *v5;
  PSTextView **p_textView;
  void *v7;
  PSTextView *v8;

  v5 = (PSTextView *)a3;
  p_textView = &self->_textView;
  if (self->_textView != v5)
  {
    v8 = v5;
    -[PSTextViewTableCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    if (*p_textView)
      -[UITextContentView removeFromSuperview](*p_textView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_textView, a3);
    -[UITextContentView setDelegate:](*p_textView, "setDelegate:", self);
    v5 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
