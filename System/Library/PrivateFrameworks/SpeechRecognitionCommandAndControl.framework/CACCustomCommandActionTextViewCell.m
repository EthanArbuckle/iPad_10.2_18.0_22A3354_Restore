@implementation CACCustomCommandActionTextViewCell

- (CACCustomCommandActionTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CACCustomCommandActionTextViewCell *v4;
  UITextView *v5;
  UITextView *textView;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UITextView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CACCustomCommandActionTextViewCell;
  v4 = -[CACCustomCommandActionTextViewCell initWithStyle:reuseIdentifier:](&v22, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UITextView *)objc_alloc_init(MEMORY[0x24BEBDA88]);
    textView = v4->_textView;
    v4->_textView = v5;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v4->_textView, "setFont:", v7);

    v8 = objc_alloc(MEMORY[0x24BDD1458]);
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.PasteTextPlaceholder"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithString:", v9);
    -[UITextView setAttributedPlaceholder:](v4->_textView, "setAttributedPlaceholder:", v10);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_textView, "setBackgroundColor:", v11);

    -[CACCustomCommandActionTextViewCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_textView);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD1628];
    v15 = v4->_textView;
    -[CACCustomCommandActionTextViewCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ax_constraintsToMakeItem:sameDimensionsAsItem:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v18);

    -[UITextView heightAnchor](v4->_textView, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 200.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v20);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v13);
  }
  return v4;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
