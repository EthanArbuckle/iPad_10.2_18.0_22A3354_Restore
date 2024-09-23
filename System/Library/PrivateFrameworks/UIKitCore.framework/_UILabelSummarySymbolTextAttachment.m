@implementation _UILabelSummarySymbolTextAttachment

- (BOOL)isOn
{
  void *v2;
  char v3;

  -[_UILabelSummarySymbolTextAttachment summarySymbolView](self, "summarySymbolView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOn");

  return v3;
}

- (void)setIsOn:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UILabelSummarySymbolTextAttachment summarySymbolView](self, "summarySymbolView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsOn:", v3);

}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[_UILabelSummarySymbolTextAttachment summarySymbolView](self, "summarySymbolView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UILabelSummarySymbolTextAttachment summarySymbolView](self, "summarySymbolView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[_UILabelSummarySymbolTextAttachment setBounds](self, "setBounds");
}

- (UIColor)foregroundColor
{
  void *v2;
  void *v3;

  -[_UILabelSummarySymbolTextAttachment summarySymbolView](self, "summarySymbolView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v2, "foregroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setForegroundColor:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  -[_UILabelSummarySymbolTextAttachment summarySymbolView](self, "summarySymbolView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForegroundColor:", v4);

}

- (double)baseline
{
  void *v2;
  double v3;
  double v4;

  -[_UILabelSummarySymbolTextAttachment summarySymbolView](self, "summarySymbolView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseline");
  v4 = v3;

  return v4;
}

- (_UILabelSummarySymbolTextAttachment)initWithSummarySymbolOn:(BOOL)a3 font:(id)a4 foregroundColor:(id)a5
{
  id v7;
  id v8;
  _UILabelSummarySymbolTextAttachment *v9;
  _UILabelSummarySymbolTextAttachment *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v13[1] = 3221225472;
  v13[2] = __84___UILabelSummarySymbolTextAttachment_initWithSummarySymbolOn_font_foregroundColor___block_invoke;
  v13[3] = &unk_1E16DFF08;
  v16 = a3;
  v14 = a4;
  v15 = a5;
  v12.receiver = self;
  v12.super_class = (Class)_UILabelSummarySymbolTextAttachment;
  v13[0] = MEMORY[0x1E0C809B0];
  v7 = v15;
  v8 = v14;
  v9 = -[_UILabelViewTextAttachment initWithViewProvider:](&v12, sel_initWithViewProvider_, v13);
  v10 = v9;
  if (v9)
    -[_UILabelSummarySymbolTextAttachment setBounds](v9, "setBounds");

  return v10;
}

- (void)setBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double Width;
  void *v9;
  id v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  -[_UILabelViewTextAttachment view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[_UILabelSummarySymbolTextAttachment baseline](self, "baseline");
  v5 = v4;
  -[_UILabelViewTextAttachment view](self, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v6 = v5 - CGRectGetHeight(v11);
  -[_UILabelViewTextAttachment view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  Width = CGRectGetWidth(v12);
  -[_UILabelViewTextAttachment view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  -[_UILabelSummarySymbolTextAttachment setBounds:](self, "setBounds:", 0.0, v6, Width, CGRectGetHeight(v13));

}

- (void)setSummarySymbolView:(id)a3
{
  objc_storeStrong((id *)&self->_summarySymbolView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarySymbolView, 0);
}

@end
