@implementation PKPassPersonalizationCell

- (PKPassPersonalizationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKPassPersonalizationCell *v4;
  PKPassPersonalizationCell *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PKPassPersonalizationCell;
  v4 = -[PKPassPersonalizationCell initWithStyle:reuseIdentifier:](&v30, sel_initWithStyle_reuseIdentifier_, 1000, a4);
  v5 = v4;
  if (v4)
  {
    -[PKPassPersonalizationCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[PKPassPersonalizationCell textLabel](v5, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_textLabelFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[PKPassPersonalizationCell textLabel](v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMinimumScaleFactor:", 0.7);

    -[PKPassPersonalizationCell textLabel](v5, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBaselineAdjustment:", 1);

    -[PKPassPersonalizationCell textLabel](v5, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

    -[PKPassPersonalizationCell textLabel](v5, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", 0);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", 0);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSecureTextEntry:", 0);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_textFieldFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v17);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAdjustsFontSizeToFitWidth:", 0);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("REQUIRED"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPlaceholder:", v20);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setClearButtonMode:", 1);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAutocorrectionType:", 1);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setKeyboardType:", 0);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextContentType:", 0);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setReturnKeyType:", 4);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setInputView:", 0);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDelegate:", v5);

    -[PKPassPersonalizationCell editableTextField](v5, "editableTextField");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addTarget:action:forControlEvents:", v5, sel__editableTextFieldChanged_, 0x20000);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)PKPassPersonalizationCell;
  -[PKPassPersonalizationCell dealloc](&v4, sel_dealloc);
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPassPersonalizationCell;
  -[PKPassPersonalizationCell prepareForReuse](&v10, sel_prepareForReuse);
  -[PKPassPersonalizationCell setContext:andContact:](self, "setContext:andContact:", 0, 0);
  -[PKPassPersonalizationCell setDelegate:](self, "setDelegate:", 0);
  -[PKPassPersonalizationCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

  -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyboardType:", 0);

  -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextContentType:", 0);

  -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutocapitalizationType:", 0);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
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
  char v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MaxX;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double rect;
  double v53;
  double v54;
  objc_super v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v55.receiver = self;
  v55.super_class = (Class)PKPassPersonalizationCell;
  -[PKPassPersonalizationCell layoutSubviews](&v55, sel_layoutSubviews);
  -[PKPassPersonalizationCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKPassPersonalizationCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v7 = v6;
    v50 = v9;
    v51 = v8;
    rect = v10;
    objc_msgSend(v4, "frame");
    v12 = v11;
    v53 = v14;
    v54 = v13;
    v49 = v15;
    v16 = -[PKPassPersonalizationCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    objc_msgSend(v5, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v46 = v23;
    objc_msgSend(v5, "layoutMargins");
    v26 = v25;
    v47 = v28;
    v48 = v27;
    v30 = fmax(v29, fmin(v7, v12) - v18);
    v56.origin.x = v18;
    v56.origin.y = v20;
    v56.size.width = v22;
    v56.size.height = v24;
    MaxX = CGRectGetMaxX(v56);
    v57.origin.x = v7;
    v57.size.width = v50;
    v57.origin.y = v51;
    v57.size.height = rect;
    v32 = CGRectGetMaxX(v57);
    v58.origin.x = v12;
    v58.size.height = v53;
    v58.origin.y = v54;
    v58.size.width = v49;
    v33 = fmax(v47, MaxX - fmax(v32, CGRectGetMaxX(v58)));
    v34 = v18 + v30;
    v35 = v20 + v26;
    v36 = v22 - (v30 + v33);
    v37 = v46 - (v26 + v48);
    objc_msgSend(v3, "sizeThatFits:", v36, v37);
    v39 = v38;
    -[PKPassPersonalizationCellContext minimumTextLabelWidth](self->_context, "minimumTextLabelWidth");
    v41 = fmin(fmax(v39, v40), v36 + -122.0);
    if ((v16 & 1) != 0)
    {
      v59.origin.x = v34;
      v59.origin.y = v35;
      v59.size.width = v36;
      v59.size.height = v37;
      v42 = CGRectGetMaxX(v59);
      v43 = v42 - v41;
      objc_msgSend(v3, "setFrame:", v42 - v41, v51, v41, rect);
      v44 = v43 - v34 + -22.0;
    }
    else
    {
      objc_msgSend(v3, "setFrame:", v34, v51, v41, rect);
      v60.origin.x = v34;
      v60.origin.y = v51;
      v60.size.width = v41;
      v60.size.height = rect;
      v45 = CGRectGetMaxX(v60) + 22.0;
      v61.origin.x = v34;
      v61.origin.y = v35;
      v61.size.width = v36;
      v61.size.height = v37;
      v44 = CGRectGetMaxX(v61) - v45;
      v34 = v45;
    }
    objc_msgSend(v4, "setFrame:", v34, v54, v44, v53);

  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  PKPassPersonalizationCellDelegate **p_delegate;
  id WeakRetained;
  id v6;
  char v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_msgSend(v6, "personalizationCellShouldBeginEditing:", self);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  PKPassPersonalizationCellDelegate **p_delegate;
  id WeakRetained;
  id v6;
  char v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_msgSend(v6, "personalizationCellShouldReturn:", self);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (double)minimumCellHeight
{
  uint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 60.0;
  if (!v2)
    return 50.0;
  return result;
}

+ (double)textLabelWidthForText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0DC1138];
  v4 = a3;
  objc_msgSend(a1, "_textLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sizeWithAttributes:", v6);
  v8 = v7;

  return v8;
}

- (void)setContext:(id)a3 andContact:(id)a4
{
  PKContact *v7;
  PKPassPersonalizationCellContext **p_context;
  PKContact **p_contact;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  PKPassPersonalizationCellContext *v19;

  v19 = (PKPassPersonalizationCellContext *)a3;
  v7 = (PKContact *)a4;
  p_context = &self->_context;
  if (self->_context != v19)
    objc_storeStrong((id *)&self->_context, a3);
  p_contact = &self->_contact;
  if (self->_contact != v7)
    objc_storeStrong((id *)&self->_contact, a4);
  if (*p_context)
  {
    -[PKPassPersonalizationCell textLabel](self, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassPersonalizationCellContext title](v19, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

    -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setKeyboardType:", -[PKPassPersonalizationCellContext keyboardType](v19, "keyboardType"));

    -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassPersonalizationCellContext textContentType](v19, "textContentType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextContentType:", v14);

    -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAutocapitalizationType:", -[PKPassPersonalizationCellContext autocapitalizationType](v19, "autocapitalizationType"));

    if (*p_contact)
    {
      -[PKPassPersonalizationCellContext stringRepresentationBlock](*p_context, "stringRepresentationBlock");
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, PKContact *))v16)[2](v16, *p_contact);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setText:", v18);

      }
    }
    -[PKPassPersonalizationCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_editableTextFieldChanged:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void (**v12)(id, void *, PKContact *);

  -[PKPassPersonalizationCellContext contactUpdateBlock](self->_context, "contactUpdateBlock", a3);
  v12 = (void (**)(id, void *, PKContact *))objc_claimAutoreleasedReturnValue();
  -[PKPassPersonalizationCellContext stringRepresentationBlock](self->_context, "stringRepresentationBlock");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

  if (v12)
  {
    -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v8, self->_contact);

    if (-[PKPassPersonalizationCellContext bindTextToStringRepresentation](self->_context, "bindTextToStringRepresentation"))
    {
      -[PKPassPersonalizationCell editableTextField](self, "editableTextField");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, PKContact *))v4)[2](v4, self->_contact);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v10);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "personalizationCellDidChangeValue:", self);

}

+ (id)_textLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 18.0);
}

+ (id)_textFieldFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
}

- (PKContact)contact
{
  return self->_contact;
}

- (PKPassPersonalizationCellContext)context
{
  return self->_context;
}

- (PKPassPersonalizationCellDelegate)delegate
{
  return (PKPassPersonalizationCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
