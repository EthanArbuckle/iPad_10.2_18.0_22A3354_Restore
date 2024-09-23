@implementation PKDiscoveryTextBlockShelfView

- (PKDiscoveryTextBlockShelfView)initWithShelf:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PKDiscoveryTextBlockShelfView *v10;
  PKDiscoveryTextBlockShelfView *v11;
  void *v12;
  void *v13;
  void *v14;
  PKNoHighlightTextView *v15;
  UITextView *textView;
  UITextView *v17;
  void *v18;
  UITextView *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSAttributedString *attributedText;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKDiscoveryTextBlockShelfView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[PKDiscoveryShelfView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_shelf, a3);
    objc_msgSend(v5, "localizedBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedLede");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedSectionHeaderLine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKNoHighlightTextView initWithFrame:]([PKNoHighlightTextView alloc], "initWithFrame:", v6, v7, v8, v9);
    textView = v11->_textView;
    v11->_textView = &v15->super;

    -[UITextView setTextContainerInset:](v11->_textView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v17 = v11->_textView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    v19 = v11->_textView;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v19, "setTextColor:", v20);

    -[UITextView textContainer](v11->_textView, "textContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLineFragmentPadding:", 0.0);

    -[UITextView setEditable:](v11->_textView, "setEditable:", 0);
    -[UITextView setScrollEnabled:](v11->_textView, "setScrollEnabled:", 0);
    -[UITextView setDelegate:](v11->_textView, "setDelegate:", v11);
    -[PKDiscoveryTextBlockShelfView _attributedStringForBody:lede:headerline:](v11, "_attributedStringForBody:lede:headerline:", v12, v13, v14);
    v22 = objc_claimAutoreleasedReturnValue();
    attributedText = v11->_attributedText;
    v11->_attributedText = (NSAttributedString *)v22;

    -[UITextView setAttributedText:](v11->_textView, "setAttributedText:", v11->_attributedText);
    -[PKDiscoveryTextBlockShelfView addSubview:](v11, "addSubview:", v11->_textView);

  }
  return v11;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKDiscoveryShelfView contentInsets](self, "contentInsets");
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", width - (v6 + v7), height);
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
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
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKDiscoveryTextBlockShelfView;
  -[PKDiscoveryTextBlockShelfView layoutSubviews](&v15, sel_layoutSubviews);
  -[PKDiscoveryTextBlockShelfView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKDiscoveryShelfView contentInsets](self, "contentInsets");
  -[UITextView setFrame:](self->_textView, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
}

- (id)_attributedStringForBody:(id)a3 lede:(id)a4 headerline:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t *v11;
  NSString *v12;
  void *v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (uint64_t *)MEMORY[0x1E0DC1140];
  if (v8)
  {
    v38[0] = *MEMORY[0x1E0DC1138];
    -[PKDiscoveryTextBlockShelfView _uiFontTextStyle](self, "_uiFontTextStyle");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign(v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    v38[1] = *v11;
    v39[0] = v13;
    -[PKDiscoveryTextBlockShelfView _textColorForBody](self, "_textColorForBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    PKAttributedStringByParsingLinksInString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

  }
  else
  {
    v14 = (uint64_t *)MEMORY[0x1E0DC1140];
    v18 = 0;
  }
  if (v9)
  {
    -[PKDiscoveryTextBlockShelfView _uiFontTextStyle](self, "_uiFontTextStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign(v19, 0, 2, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = *v14;
    v36[0] = *MEMORY[0x1E0DC1138];
    v36[1] = v21;
    v37[0] = v20;
    -[PKDiscoveryTextBlockShelfView _textColorForLede](self, "_textColorForLede");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v23);
    if (v18)
      objc_msgSend(v18, "insertAttributedString:atIndex:", v24, 0);
    else
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v24);

  }
  if (v10)
  {
    -[PKDiscoveryTextBlockShelfView _uiFontTextStyle](self, "_uiFontTextStyle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign(v25, 0, 2, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = *v14;
    v34[0] = *MEMORY[0x1E0DC1138];
    v34[1] = v27;
    v35[0] = v26;
    -[PKDiscoveryTextBlockShelfView _textColorForHeaderline](self, "_textColorForHeaderline");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v30 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v10);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithString:attributes:", v31, v29);

      objc_msgSend(v18, "insertAttributedString:atIndex:", v32, 0);
    }
    else
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v10, v29);
    }

  }
  return v18;
}

- (id)_textColorForBody
{
  void *v2;

  if ((unint64_t)-[PKDiscoveryTextBlockShelf style](self->_shelf, "style") > 1)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_textColorForLede
{
  uint64_t v2;
  void *v3;

  v2 = -[PKDiscoveryTextBlockShelf style](self->_shelf, "style");
  if (v2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_textColorForHeaderline
{
  uint64_t v2;
  void *v3;

  v2 = -[PKDiscoveryTextBlockShelf style](self->_shelf, "style");
  if (v2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_uiFontTextStyle
{
  id v3;
  id v4;

  v3 = (id)*MEMORY[0x1E0DC4B60];
  if (-[PKDiscoveryTextBlockShelf style](self->_shelf, "style") == 1)
  {
    v4 = (id)*MEMORY[0x1E0DC4AA0];

    v3 = v4;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_shelf, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
