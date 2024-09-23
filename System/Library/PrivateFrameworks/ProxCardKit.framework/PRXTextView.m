@implementation PRXTextView

- (PRXTextView)initWithStyle:(int64_t)a3
{
  PRXTextView *v4;
  PRXTextView *v5;
  PRXTextStyleDefinition *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PRXTextView *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PRXTextView;
  v4 = -[PRXTextView init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = -[PRXTextStyleDefinition initWithStyle:]([PRXTextStyleDefinition alloc], "initWithStyle:", a3);
    -[PRXTextStyleDefinition textColor](v6, "textColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXTextView setTextColor:](v5, "setTextColor:", v7);

    -[PRXTextStyleDefinition font](v6, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXTextView setFont:](v5, "setFont:", v8);

    -[PRXTextView setTextAlignment:](v5, "setTextAlignment:", -[PRXTextStyleDefinition textAlignment](v6, "textAlignment"));
    -[PRXTextView setAccessibilityTraits:](v5, "setAccessibilityTraits:", -[PRXTextStyleDefinition accessibilityTraits](v6, "accessibilityTraits"));
    v9 = -[PRXTextStyleDefinition numberOfLines](v6, "numberOfLines");
    -[PRXTextView textContainer](v5, "textContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMaximumNumberOfLines:", v9);

    -[PRXTextView setScrollEnabled:](v5, "setScrollEnabled:", 0);
    -[PRXTextView setShowsVerticalScrollIndicator:](v5, "setShowsVerticalScrollIndicator:", 0);
    -[PRXTextView setShowsHorizontalScrollIndicator:](v5, "setShowsHorizontalScrollIndicator:", 0);
    -[PRXTextView setAutomaticallyAdjustsScrollIndicatorInsets:](v5, "setAutomaticallyAdjustsScrollIndicatorInsets:", 0);
    -[PRXTextView setEditable:](v5, "setEditable:", 0);
    -[PRXTextView setSelectable:](v5, "setSelectable:", 0);
    -[PRXTextView setAdjustsFontForContentSizeCategory:](v5, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXTextView setBackgroundColor:](v5, "setBackgroundColor:", v11);

    -[PRXTextView setTextContainerInset:](v5, "setTextContainerInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    -[PRXTextView textContainer](v5, "textContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLineFragmentPadding:", 0.0);

    -[PRXTextView layoutManager](v5, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUsesFontLeading:", 0);

    v14 = v5;
  }

  return v5;
}

+ (PRXTextView)textViewWithStyle:(int64_t)a3
{
  return (PRXTextView *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:", a3);
}

- (void)setTitleText:(id)a3
{
  PRXTextStyleDefinition *v4;
  id v5;
  id v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  if (self->_style)
  {
    v4 = (PRXTextStyleDefinition *)a3;
    -[PRXTextView setText:](self, "setText:", v4);
  }
  else
  {
    v5 = a3;
    v4 = -[PRXTextStyleDefinition initWithStyle:]([PRXTextStyleDefinition alloc], "initWithStyle:", self->_style);
    v6 = objc_alloc_init(MEMORY[0x24BDF6748]);
    LODWORD(v7) = 1045220557;
    objc_msgSend(v6, "setHyphenationFactor:", v7);
    objc_msgSend(v6, "setAlignment:", -[PRXTextStyleDefinition textAlignment](v4, "textAlignment"));
    objc_msgSend(v6, "setLineBreakStrategy:", 0xFFFFLL);
    v8 = *MEMORY[0x24BDF6628];
    v15[0] = v6;
    v9 = *MEMORY[0x24BDF65F8];
    v14[0] = v8;
    v14[1] = v9;
    -[PRXTextStyleDefinition font](v4, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v10;
    v14[2] = *MEMORY[0x24BDF6600];
    -[PRXTextStyleDefinition textColor](v4, "textColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v5, v12);
    -[PRXTextView setAttributedText:](self, "setAttributedText:", v13);

  }
}

- (int64_t)style
{
  return self->_style;
}

@end
