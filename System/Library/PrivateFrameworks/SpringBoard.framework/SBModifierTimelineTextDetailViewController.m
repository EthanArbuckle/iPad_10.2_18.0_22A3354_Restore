@implementation SBModifierTimelineTextDetailViewController

- (void)viewDidLoad
{
  id v3;
  UITextView *v4;
  UITextView *textView;
  UITextView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBModifierTimelineTextDetailViewController;
  -[SBModifierTimelineTextDetailViewController viewDidLoad](&v11, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0CEAB18]);
  v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  textView = self->_textView;
  self->_textView = v4;

  v6 = self->_textView;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](v6, "setFont:", v7);

  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[SBModifierTimelineTextDetailViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_textView);

  -[SBModifierTimelineTextDetailViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithTitle:style:target:action:", CFSTR("Copy text"), 0, self, sel__copyText);
  objc_msgSend(v9, "setRightBarButtonItem:", v10);

}

- (void)_copyText
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setString:", self->_text);

}

- (void)setText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_text, a3);
  v5 = a3;
  -[SBModifierTimelineTextDetailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[UITextView setText:](self->_textView, "setText:", v5);

  -[SBModifierTimelineTextDetailViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)setAttributedText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_attributedText, a3);
  v5 = a3;
  -[SBModifierTimelineTextDetailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v5);

  -[SBModifierTimelineTextDetailViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)prepareForReuse
{
  -[SBModifierTimelineTextDetailViewController setText:](self, "setText:", 0);
  -[SBModifierTimelineTextDetailViewController setAttributedText:](self, "setAttributedText:", 0);
}

- (void)viewWillLayoutSubviews
{
  UITextView *textView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBModifierTimelineTextDetailViewController;
  -[SBModifierTimelineTextDetailViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  textView = self->_textView;
  -[SBModifierTimelineTextDetailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UITextView setFrame:](textView, "setFrame:");

}

- (NSString)text
{
  return self->_text;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
