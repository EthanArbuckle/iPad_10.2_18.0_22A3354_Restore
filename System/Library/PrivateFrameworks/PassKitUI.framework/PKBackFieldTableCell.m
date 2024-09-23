@implementation PKBackFieldTableCell

- (PKBackFieldTableCell)initWithBridgeStyle:(BOOL)a3 reuseIdentifier:(id)a4
{
  PKBackFieldTableCell *v5;
  PKBackFieldTableCell *v6;
  uint64_t v7;
  UITextView *valueTextView;
  void *v9;
  void *v10;

  v5 = -[PKBackFieldTableCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, a4);
  v6 = v5;
  if (v5)
  {
    v5->_useBridgeStyle = a3;
    objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = objc_claimAutoreleasedReturnValue();
    valueTextView = v6->_valueTextView;
    v6->_valueTextView = (UITextView *)v7;

    -[UITextView textContainer](v6->_valueTextView, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

    -[UITextView setTextContainerInset:](v6->_valueTextView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView setDelegate:](v6->_valueTextView, "setDelegate:", v6);
    -[PKBackFieldTableCell contentView](v6, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v6->_valueTextView);

    -[PKBackFieldTableCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKBackFieldTableCell;
  -[PKBackFieldTableCell dealloc](&v2, sel_dealloc);
}

- (void)_setUpValueTextViewAttributes
{
  UITextView *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  UITextView *v14;

  v3 = self->_valueTextView;
  v14 = v3;
  if (self->_showLinks)
  {
    -[UITextView setDataDetectorTypes:](v3, "setDataDetectorTypes:", -[PKPassField dataDetectorTypes](self->_field, "dataDetectorTypes"));
  }
  else
  {
    -[UITextView webView](v3, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDataDetectorTypes:", 0);
    objc_msgSend(v4, "setAllowsDataDetectorsSheet:", 0);
    objc_msgSend(v4, "setAllowsImageSheet:", 0);
    objc_msgSend(v4, "setAllowsLinkSheet:", 0);

  }
  -[UITextView setSelectable:](v14, "setSelectable:", self->_showLinks);
  -[UITextView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", self->_showLinks);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[PKPassField cellStyle](self->_field, "cellStyle") == 3)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DC1140]);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1138]);

  -[PKPassField link](self->_field, "link");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassField value](self->_field, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 && objc_msgSend(v9, "length"))
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1160]);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v5);
  }
  else
  {
    PKAttributedStringByParsingLinksInString();
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  -[UITextView setAttributedText:](v14, "setAttributedText:", v11);

  -[UITextView setTextAlignment:](v14, "setTextAlignment:", 4);
  -[PKBackFieldTableCell _linkTextAttributes](self, "_linkTextAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setLinkTextAttributes:](v14, "setLinkTextAttributes:", v13);

}

- (void)setShowLinks:(BOOL)a3
{
  if (self->_showLinks != a3)
  {
    self->_showLinks = a3;
    -[PKBackFieldTableCell _setUpValueTextViewAttributes](self, "_setUpValueTextViewAttributes");
    -[PKBackFieldTableCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKBackFieldTableCell;
  -[PKBackFieldTableCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  self->_cachedWidth = 0.0;
}

- (void)setField:(id)a3
{
  void *v5;
  PKPassField *v6;

  v6 = (PKPassField *)a3;
  if (self->_field != v6)
  {
    objc_storeStrong((id *)&self->_field, a3);
    self->_cachedWidth = 0.0;
    -[PKBackFieldTableCell _setUpTitleLabelAttributes](self, "_setUpTitleLabelAttributes");
    -[PKBackFieldTableCell _setUpValueTextViewAttributes](self, "_setUpValueTextViewAttributes");
    -[PKPassField key](v6, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKAccessibilityIDCellSet(self, v5);

    -[PKBackFieldTableCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double computedHeight;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKBackFieldTableCell _textBounds](self, "_textBounds");
  if (self->_cachedWidth == v6)
  {
    computedHeight = self->_computedHeight;
  }
  else
  {
    self->_cachedWidth = v6;
    -[PKBackFieldTableCell _computeSizeWithBounds:shouldLayOut:](self, "_computeSizeWithBounds:shouldLayOut:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
    width = v8;
  }
  v9 = width;
  result.height = computedHeight;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKBackFieldTableCell;
  -[PKBackFieldTableCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKBackFieldTableCell bounds](self, "bounds");
  -[PKBackFieldTableCell _computeSizeWithBounds:shouldLayOut:](self, "_computeSizeWithBounds:shouldLayOut:", 1);
}

- (CGSize)_computeSizeWithBounds:(CGRect)a3 shouldLayOut:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat MaxY;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double computedHeight;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  CGSize result;
  CGRect v67;
  CGRect v68;

  v4 = a4;
  width = a3.size.width;
  -[PKBackFieldTableCell _textBounds](self, "_textBounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PKBackFieldTableCell textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = width;
  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(v13, "text");
    v15 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 == CFSTR(" "))
    {
      v17 = 0;
    }
    else if (v15)
    {
      v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR(" ")) ^ 1;
    }
    else
    {
      v17 = 1;
    }

  }
  else
  {
    v17 = 0;
  }

  -[UITextView text](self->_valueTextView, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  v20 = -[PKPassField cellStyle](self->_field, "cellStyle");
  v21 = 10.0;
  if (v20 == 3)
    v21 = 0.0;
  v64 = v12;
  v22 = v12 - v21;
  -[UITextView sizeThatFits:](self->_valueTextView, "sizeThatFits:", v12 - v21, 1.79769313e308);
  v24 = v23;
  v26 = v25;
  if (v17)
  {
    objc_msgSend(v13, "sizeThatFits:", v22, 1.79769313e308);
    v28 = v27;
    v30 = v29;
    v31 = *MEMORY[0x1E0C9D820];
    v32 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v31 = *MEMORY[0x1E0C9D820];
    v32 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v30 = v32;
    v28 = *MEMORY[0x1E0C9D820];
  }
  if (v19)
  {
    v33 = v24;
  }
  else
  {
    v26 = v32;
    v33 = v31;
  }
  -[PKBackFieldTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", v31);
  v34 = -[PKPassField cellStyle](self->_field, "cellStyle");
  if (v34 < 3)
  {
    v35 = v64;
    if (v33 + v28 + 10.0 > v64)
    {
      v36 = v10;
      v37 = v32;
      if (v17)
      {
        objc_msgSend(v13, "sizeThatFits:", v64, 1.79769313e308);
        v37 = v38;
      }
      if (v19)
      {
        -[UITextView sizeThatFits:](self->_valueTextView, "sizeThatFits:", v64, 1.79769313e308);
        v32 = v39;
      }
      v40 = v36 + 7.0;
      v67.origin.x = v8;
      v67.origin.y = v36 + 7.0;
      v67.size.width = v64;
      v67.size.height = v37;
      MaxY = CGRectGetMaxY(v67);
      self->_computedHeight = fmax(v37 + v32 + 7.0 + 7.0, 58.0);
      v42 = MaxY + 2.0;
      v43 = v64;
      v44 = v8;
      if (!v4)
        goto LABEL_34;
LABEL_33:
      v58 = v42;
      objc_msgSend(v13, "setFrame:", v8, v40, v43, v37);
      -[UITextView setFrame:](self->_valueTextView, "setFrame:", v44, v58, v35, v32);
      goto LABEL_34;
    }
    self->_computedHeight = fmax(fmax(fmax(v30, 34.0), v26) + 7.0 + 7.0, 48.0);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v8 = v50;
    v40 = v51;
    v43 = v52;
    v37 = v53;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v44 = v54;
    v42 = v55;
    v35 = v56;
    v32 = v57;
LABEL_32:
    if (!v4)
      goto LABEL_34;
    goto LABEL_33;
  }
  v63 = v26;
  v45 = v10;
  v46 = v8;
  v32 = 0.0;
  v35 = 0.0;
  v42 = 0.0;
  v44 = 0.0;
  v37 = 0.0;
  v43 = 0.0;
  v40 = 0.0;
  v8 = 0.0;
  if (v34 != 3)
    goto LABEL_32;
  v42 = v45 + 7.0;
  if (((v19 != 0) & v17) != 0)
    v47 = 58.0;
  else
    v47 = 48.0;
  v8 = v46;
  if (v19)
  {
    v48 = v45 + 7.0;
    -[UITextView pkui_textFrame](self->_valueTextView, "pkui_textFrame");
    v49 = CGRectGetMaxY(v68);
    v42 = v48;
    v40 = v49;
  }
  else
  {
    v62 = fmax(v30, v47 + -7.0 + -7.0);
    if (v17)
      v30 = v62;
    v40 = v45 + 7.0;
  }
  v32 = v63;
  v43 = v64;
  self->_computedHeight = fmax(v47, v63 + 7.0 + v30 + 7.0);
  v35 = v64;
  v44 = v8;
  v37 = v30;
  if (v4)
    goto LABEL_33;
LABEL_34:
  computedHeight = self->_computedHeight;

  v60 = v65;
  v61 = computedHeight;
  result.height = v61;
  result.width = v60;
  return result;
}

- (CGRect)_textBounds
{
  double v3;
  double v4;
  int v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[PKBackFieldTableCell separatorInset](self, "separatorInset");
  v4 = v3;
  v5 = -[PKBackFieldTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v5)
    v6 = 15.0;
  else
    v6 = v4;
  if (v5)
    v7 = v4;
  else
    v7 = 15.0;
  -[PKBackFieldTableCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v6 + v11;
  v14 = v13 + 0.0;
  v16 = v15 - (v6 + v7);

  v17 = v12;
  v18 = v14;
  v19 = v16;
  v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_setUpTitleLabelAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PKBackFieldTableCell textLabel](self, "textLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassField label](self->_field, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v3);

  if (-[PKPassField cellStyle](self->_field, "cellStyle") == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

}

- (id)_linkTextAttributes
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (self->_useBridgeStyle)
    PKBridgeButtonTextColor();
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC1248];
  v6[0] = *MEMORY[0x1E0DC1140];
  v6[1] = v3;
  v7[0] = v2;
  v7[1] = &unk_1E3FACF70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8
    && (objc_msgSend(v8, "absoluteString"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple.Home-private://userLockSettings/")),
        v10,
        v11)
    && (v12 = (id)*MEMORY[0x1E0D6A190]) != 0)
  {
    v13 = v12;
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D22D78]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D28]);
    SBSCreateOpenApplicationService();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__PKBackFieldTableCell_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    v19[3] = &unk_1E3E68160;
    v20 = v9;
    v21 = v13;
    objc_msgSend(v15, "openApplication:withOptions:completion:", v13, v16, v19);

    v17 = 0;
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

void __75__PKBackFieldTableCell_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412802;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Attempted to open %@ at for %@, but got error: %@", (uint8_t *)&v10, 0x20u);
    }

  }
}

- (PKPassField)field
{
  return self->_field;
}

- (BOOL)showLinks
{
  return self->_showLinks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTextView, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

@end
