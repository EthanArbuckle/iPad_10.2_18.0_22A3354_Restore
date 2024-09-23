@implementation TUICandidateInlineTextView

- (void)commonInit
{
  id v3;
  UILabel *v4;
  UILabel *label;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  -[TUICandidateInlineTextView bounds](self, "bounds");
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:");
  label = self->_label;
  self->_label = v4;

  objc_msgSend(MEMORY[0x1E0DC37E8], "boldSystemFontOfSize:", 18.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v6);

  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", 5);
  -[UILabel setBaselineAdjustment:](self->_label, "setBaselineAdjustment:", 1);
  -[TUICandidateInlineTextView addSubview:](self, "addSubview:", self->_label);
  -[UILabel setAutoresizingMask:](self->_label, "setAutoresizingMask:", 18);
}

- (TUICandidateInlineTextView)initWithFrame:(CGRect)a3
{
  TUICandidateInlineTextView *v3;
  TUICandidateInlineTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateInlineTextView;
  v3 = -[TUICandidateInlineTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUICandidateInlineTextView commonInit](v3, "commonInit");
  return v4;
}

- (TUICandidateInlineTextView)initWithCoder:(id)a3
{
  TUICandidateInlineTextView *v3;
  TUICandidateInlineTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateInlineTextView;
  v3 = -[TUICandidateInlineTextView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUICandidateInlineTextView commonInit](v3, "commonInit");
  return v4;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    text = self->_text;
    self->_text = v4;

    v6 = self->_text;
    -[TUICandidateInlineTextView label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
}

- (void)updateLabels
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  CGRect v14;
  CGRect v15;

  -[TUICandidateInlineTextView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUICandidateInlineTextView style](self, "style");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "gridPadding");
  v12 = v11 + 10.0;
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  v15 = CGRectInset(v14, v12, 1.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);

}

- (void)setStyle:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[TUICandidateViewStyle isEqual:](self->_style, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    objc_msgSend(v7, "textColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateInlineTextView label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v5);

    -[TUICandidateInlineTextView updateLabels](self, "updateLabels");
  }

}

- (NSString)text
{
  return self->_text;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
