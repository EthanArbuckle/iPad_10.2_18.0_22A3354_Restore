@implementation PKListTextFieldContentView

- (PKListTextFieldContentView)initWithConfiguration:(id)a3
{
  id v4;
  PKListTextFieldContentView *v5;
  PKListTextFieldContentView *v6;

  v4 = a3;
  v5 = -[PKListTextFieldContentView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
    -[PKListTextFieldContentView setConfiguration:](v5, "setConfiguration:", v4);

  return v6;
}

- (PKListTextFieldContentView)initWithFrame:(CGRect)a3
{
  PKListTextFieldContentView *v3;
  UILabel *v4;
  UILabel *textLabel;
  UILabel *v6;
  UILabel *secondaryTextLabel;
  UITextField *v8;
  UITextField *textField;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKListTextFieldContentView;
  v3 = -[PKListTextFieldContentView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v4;

    -[PKListTextFieldContentView addSubview:](v3, "addSubview:", v3->_textLabel);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryTextLabel = v3->_secondaryTextLabel;
    v3->_secondaryTextLabel = v6;

    -[PKListTextFieldContentView addSubview:](v3, "addSubview:", v3->_secondaryTextLabel);
    v8 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    textField = v3->_textField;
    v3->_textField = v8;

    -[UITextField setDelegate:](v3->_textField, "setDelegate:", v3);
    -[UITextField addTarget:action:forControlEvents:](v3->_textField, "addTarget:action:forControlEvents:", v3, sel__textFieldTextDidChange_, 0x20000);
    -[PKListTextFieldContentView addSubview:](v3, "addSubview:", v3->_textField);
  }
  return v3;
}

- (void)setConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    -[PKListTextFieldContentView _applyConfiguration:](self, "_applyConfiguration:", v5);
  }

}

- (void)_applyConfiguration:(id)a3
{
  UILabel *textLabel;
  id v5;
  void *v6;
  UITextField *textField;
  void *v8;
  UITextField *v9;
  void *v10;
  UILabel *secondaryTextLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  id v18;

  textLabel = self->_textLabel;
  v5 = a3;
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](textLabel, "setText:", v6);

  textField = self->_textField;
  objc_msgSend(v5, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](textField, "setText:", v8);

  v9 = self->_textField;
  objc_msgSend(v5, "placeholderText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](v9, "setPlaceholder:", v10);

  secondaryTextLabel = self->_secondaryTextLabel;
  objc_msgSend(v5, "secondaryText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](secondaryTextLabel, "setText:", v12);

  objc_msgSend(v5, "textProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKListTextFieldContentView _applyTextProperties:toLabel:](self, "_applyTextProperties:toLabel:", v13, self->_textLabel);

  objc_msgSend(v5, "textProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKListTextFieldContentView _applyTextProperties:toTextField:](self, "_applyTextProperties:toTextField:", v14, self->_textField);

  objc_msgSend(v5, "secondaryTextProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKListTextFieldContentView _applyTextProperties:toLabel:](self, "_applyTextProperties:toLabel:", v15, self->_secondaryTextLabel);

  -[UITextField setClearsOnBeginEditing:](self->_textField, "setClearsOnBeginEditing:", objc_msgSend(v5, "clearsOnBeginEditing"));
  -[UITextField setClearsOnInsertion:](self->_textField, "setClearsOnInsertion:", objc_msgSend(v5, "clearsOnInsertion"));
  -[UITextField setReturnKeyType:](self->_textField, "setReturnKeyType:", objc_msgSend(v5, "returnKeyType"));
  -[UITextField setKeyboardType:](self->_textField, "setKeyboardType:", objc_msgSend(v5, "keyboardType"));
  -[UITextField setAutocorrectionType:](self->_textField, "setAutocorrectionType:", objc_msgSend(v5, "autocorrectionType"));
  objc_msgSend(v5, "error");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v16 = self->_secondaryTextLabel;
    objc_msgSend(v18, "localizedDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v16, "setText:", v17);

    -[PKListTextFieldContentView _updateErrorState:](self, "_updateErrorState:", 1);
  }
  if (-[UITextField isFirstResponder](self->_textField, "isFirstResponder"))
    -[PKListTextFieldContentView beginEditing](self, "beginEditing");
  else
    -[PKListTextFieldContentView endEditing](self, "endEditing");
  -[PKListTextFieldContentView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setToolbarItems:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3E68]);
    objc_msgSend(v4, "setItems:", v5);
    objc_msgSend(v4, "sizeToFit");
    -[UITextField setInputAccessoryView:](self->_textField, "setInputAccessoryView:", v4);

  }
  else
  {
    -[UITextField setInputAccessoryView:](self->_textField, "setInputAccessoryView:", 0);
  }

}

- (void)_applyTextProperties:(id)a3 toLabel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "resolvedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);

  objc_msgSend(v7, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v9);

  objc_msgSend(v6, "setTextAlignment:", -[PKListTextFieldContentView _textAlignmentForListAlignment:](self, "_textAlignmentForListAlignment:", objc_msgSend(v7, "alignment")));
  objc_msgSend(v6, "setLineBreakMode:", objc_msgSend(v7, "lineBreakMode"));
  objc_msgSend(v6, "setNumberOfLines:", objc_msgSend(v7, "numberOfLines"));
  objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", objc_msgSend(v7, "adjustsFontSizeToFitWidth"));
  objc_msgSend(v7, "minimumScaleFactor");
  objc_msgSend(v6, "setMinimumScaleFactor:");
  objc_msgSend(v6, "setAllowsDefaultTighteningForTruncation:", objc_msgSend(v7, "allowsDefaultTighteningForTruncation"));
  objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", objc_msgSend(v7, "adjustsFontForContentSizeCategory"));
  objc_msgSend(v6, "text");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "transform");

  -[PKListTextFieldContentView _transformedText:forTransform:](self, "_transformedText:forTransform:", v12, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v11);

}

- (void)_applyTextProperties:(id)a3 toTextField:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v6 = a3;
  objc_msgSend(v6, "resolvedColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v7);

  objc_msgSend(v6, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v8);

  objc_msgSend(v12, "setTextAlignment:", -[PKListTextFieldContentView _textAlignmentForListAlignment:](self, "_textAlignmentForListAlignment:", objc_msgSend(v6, "alignment")));
  objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", objc_msgSend(v6, "adjustsFontSizeToFitWidth"));
  objc_msgSend(v6, "minimumScaleFactor");
  objc_msgSend(v12, "setMinimumFontSize:");
  objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", objc_msgSend(v6, "adjustsFontForContentSizeCategory"));
  objc_msgSend(v12, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKListTextFieldContentView _transformedText:forTransform:](self, "_transformedText:forTransform:", v9, objc_msgSend(v6, "transform"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v10);

  v11 = objc_msgSend(v6, "transform");
  objc_msgSend(v12, "setAutocapitalizationType:", -[PKListTextFieldContentView _textAutocapTypeForTextTransform:](self, "_textAutocapTypeForTextTransform:", v11));

}

- (int64_t)_textAlignmentForListAlignment:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 2)
    return 3;
  if (a3)
    return 1;
  if (-[PKListTextFieldContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", v3, v4))return 2;
  return 0;
}

- (id)_transformedText:(id)a3 forTransform:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 3:
      objc_msgSend(v5, "pk_capitalizedStringForPreferredLocale");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v5, "pk_lowercaseStringForPreferredLocale");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(v5, "pk_uppercaseStringForPreferredLocale");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = v5;
      break;
  }
  v8 = v7;

  return v8;
}

- (int64_t)_textAutocapTypeForTextTransform:(int64_t)a3
{
  int64_t v3;

  v3 = 3;
  if (a3 != 1)
    v3 = 0;
  if (a3 == 3)
    return 1;
  else
    return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKListTextFieldContentView;
  -[PKListTextFieldContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKListTextFieldContentView bounds](self, "bounds");
  -[PKListTextFieldContentView _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKListTextFieldContentView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  void *v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  _QWORD rect[5];
  CGRect remainder;
  CGSize result;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKListTextFieldContentView configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)&rect[1] = *MEMORY[0x1E0C9D628];
  *(_OWORD *)&rect[3] = v9;
  -[PKListTextFieldContentConfiguration directionalLayoutMargins](self->_configuration, "directionalLayoutMargins");
  *(double *)rect = x;
  v11 = x + v10;
  v13 = y + v12;
  v15 = width - (v10 + v14);
  v17 = v12 + v16;
  v18 = height - (v12 + v16);
  remainder.origin.x = v11;
  remainder.origin.y = y + v12;
  remainder.size.width = v15;
  remainder.size.height = v18;
  if (!self->_isTemplateLayout && objc_msgSend(v8, "focusTextField"))
    -[UITextField setFrame:](self->_textField, "setFrame:", v11, v13, v15, v18);
  if (objc_msgSend(v8, "mode", *(_QWORD *)&y)
    && (-[UILabel text](self->_secondaryTextLabel, "text"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v19))
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryTextLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v15, v18);
    v21 = v20;
    v23 = v22;
    if (v20 <= v15 * 0.5)
    {
      v59.origin.x = v11;
      v59.origin.y = v13;
      v59.size.width = v15;
      v59.size.height = v18;
      CGRectDivide(v59, (CGRect *)&rect[1], &remainder, v21, CGRectMinXEdge);
      if (!self->_isTemplateLayout)
        -[UILabel setFrame:](self->_secondaryTextLabel, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      -[PKListTextFieldContentConfiguration textToSecondaryTextHorizontalPadding](self->_configuration, "textToSecondaryTextHorizontalPadding");
      v48 = v47;
      CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v47, CGRectMinXEdge);
      if (!self->_isTemplateLayout)
        -[UILabel setFrame:](self->_textLabel, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      if ((objc_msgSend(v8, "focusTextField") & 1) == 0 && !self->_isTemplateLayout)
        -[UITextField setFrame:](self->_textField, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_textLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
      v30 = v48 + fmax(v49, v23);
    }
    else
    {
      -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_textLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v15, v18);
      v24 = v23;
      v26 = v25;
      v57.origin.x = v11;
      v57.origin.y = v13;
      v57.size.width = v15;
      v57.size.height = v18;
      v27 = v24;
      CGRectDivide(v57, (CGRect *)&rect[1], &remainder, v24, CGRectMinYEdge);
      if (!self->_isTemplateLayout)
        -[UILabel setFrame:](self->_secondaryTextLabel, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      -[PKListTextFieldContentConfiguration textToSecondaryTextVerticalPadding](self->_configuration, "textToSecondaryTextVerticalPadding");
      v29 = v28;
      CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v28, CGRectMinYEdge);
      CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v26, CGRectMinYEdge);
      if (!self->_isTemplateLayout)
        -[UILabel setFrame:](self->_textLabel, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      if ((objc_msgSend(v8, "focusTextField") & 1) == 0 && !self->_isTemplateLayout)
        -[UITextField setFrame:](self->_textField, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      v30 = v26 + v27 + v29;
    }
    v44 = v53;
    v34 = v30 + 0.0;
  }
  else
  {
    -[UILabel text](self->_textLabel, "text");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_textLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v15, v18);
      v33 = v32;
      v58.origin.x = v11;
      v58.origin.y = v13;
      v58.size.width = v15;
      v58.size.height = v18;
      CGRectDivide(v58, (CGRect *)&rect[1], &remainder, v33, CGRectMinYEdge);
      if (!self->_isTemplateLayout)
      {
        -[UILabel setFrame:](self->_textLabel, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
        if ((objc_msgSend(v8, "focusTextField") & 1) == 0)
          -[UITextField setFrame:](self->_textField, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      }
      v34 = v33 + 0.0;
    }
    else
    {
      v34 = 0.0;
      if (!self->_isTemplateLayout)
      {
        v35 = *MEMORY[0x1E0C9D648];
        v36 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v37 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v38 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        -[UILabel setFrame:](self->_textLabel, "setFrame:", *MEMORY[0x1E0C9D648], v36, v37, v38);
        -[UITextField setFrame:](self->_textField, "setFrame:", v35, v36, v37, v38);
      }
    }
    -[PKListTextFieldContentConfiguration textToSecondaryTextVerticalPadding](self->_configuration, "textToSecondaryTextVerticalPadding");
    v40 = v39;
    -[UILabel text](self->_secondaryTextLabel, "text");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryTextLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
      v43 = v42;
      CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v40, CGRectMinYEdge);
      CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v43, CGRectMinYEdge);
      if (!self->_isTemplateLayout)
        -[UILabel setFrame:](self->_secondaryTextLabel, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      v34 = v34 + v40 + v43;
    }
    else if (!self->_isTemplateLayout)
    {
      -[UILabel setFrame:](self->_secondaryTextLabel, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    v44 = v53;
    if (v34 == 0.0)
    {
      -[UITextField sizeThatFits:](self->_textField, "sizeThatFits:", width, height);
      v46 = v45;
      if (!self->_isTemplateLayout)
      {
        CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v45, CGRectMinYEdge);
        -[UITextField setFrame:](self->_textField, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      }
      v34 = v34 + v46;
    }
  }
  *(_QWORD *)&v60.origin.x = rect[0];
  v60.origin.y = v44;
  v60.size.width = width;
  v60.size.height = height;
  v50 = CGRectGetWidth(v60);

  v51 = v50;
  v52 = v17 + v34;
  result.height = v52;
  result.width = v51;
  return result;
}

- (id)textFieldText
{
  return -[UITextField text](self->_textField, "text");
}

- (void)beginEditing
{
  -[UITextField setHidden:](self->_textField, "setHidden:", 0);
  -[UILabel setHidden:](self->_textLabel, "setHidden:", 1);
  -[UILabel setUserInteractionEnabled:](self->_textLabel, "setUserInteractionEnabled:", 1);
  if (-[PKListTextFieldContentConfiguration focusTextField](self->_configuration, "focusTextField"))
    -[UILabel setHidden:](self->_secondaryTextLabel, "setHidden:", 1);
  -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (void)endEditing
{
  _BOOL8 v3;

  v3 = -[PKListTextFieldContentView _keepTextFieldVisible](self, "_keepTextFieldVisible");
  -[UITextField setHidden:](self->_textField, "setHidden:", v3 ^ 1);
  -[UILabel setHidden:](self->_textLabel, "setHidden:", v3);
  -[UILabel setUserInteractionEnabled:](self->_textLabel, "setUserInteractionEnabled:", 0);
  if (-[PKListTextFieldContentConfiguration focusTextField](self->_configuration, "focusTextField"))
    -[UILabel setHidden:](self->_secondaryTextLabel, "setHidden:", 0);
  -[UITextField resignFirstResponder](self->_textField, "resignFirstResponder");
}

- (void)resetTextFieldTextFromLabel
{
  UITextField *textField;
  id v3;

  textField = self->_textField;
  -[UILabel text](self->_textLabel, "text");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](textField, "setText:", v3);

}

- (void)_textFieldTextDidChange:(id)a3
{
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[PKListTextFieldContentView configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hasErrorHandler");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PKListTextFieldContentView _updateErrorState:](self, "_updateErrorState:", ((uint64_t (**)(_QWORD, id))v5)[2](v5, v6));

}

- (void)_updateErrorState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PKListTextFieldContentView configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v3)
  {
    objc_msgSend(v5, "errorColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
  }
  else
  {
    objc_msgSend(v5, "textProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "secondaryTextProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v7);
  -[UITextField setTextColor:](self->_textField, "setTextColor:", v7);
  -[UILabel setTextColor:](self->_secondaryTextLabel, "setTextColor:", v6);

}

- (BOOL)_keepTextFieldVisible
{
  void *v2;
  BOOL v3;

  -[PKListTextFieldContentView configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mode") == 1;

  return v3;
}

- (void)prepareForReuse
{
  PKListTextFieldContentConfiguration *configuration;

  -[UILabel setText:](self->_textLabel, "setText:", 0);
  -[UILabel setText:](self->_secondaryTextLabel, "setText:", 0);
  -[UITextField setText:](self->_textField, "setText:", 0);
  configuration = self->_configuration;
  self->_configuration = 0;

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[PKListTextFieldContentViewDelegate textFieldShouldReturn:forContentView:](self->_delegate, "textFieldShouldReturn:forContentView:", v4, self);
  else
    v5 = 0;

  return v5;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKListTextFieldContentViewDelegate textFieldDidBeginEditing:forContentView:](self->_delegate, "textFieldDidBeginEditing:forContentView:", v4, self);

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKListTextFieldContentViewDelegate textFieldDidEndEditing:forContentView:](self->_delegate, "textFieldDidEndEditing:forContentView:", v4, self);

}

- (void)textFieldDidChangeSelection:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKListTextFieldContentViewDelegate textFieldDidChangeSelection:forContentView:](self->_delegate, "textFieldDidChangeSelection:forContentView:", v4, self);

}

- (PKListTextFieldContentConfiguration)configuration
{
  return self->_configuration;
}

- (PKListTextFieldContentViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
