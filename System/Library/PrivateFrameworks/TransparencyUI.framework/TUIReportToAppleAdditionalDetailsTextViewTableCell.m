@implementation TUIReportToAppleAdditionalDetailsTextViewTableCell

- (TUIReportToAppleAdditionalDetailsTextViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  TUIReportToAppleAdditionalDetailsTextViewTableCell *v9;
  UIScrollView *v10;
  UIScrollView *scrollView;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *placeholderText;
  objc_super v20;

  v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TUIReportToAppleAdditionalDetailsTextViewTableCell;
  v9 = -[PSTextViewTableCell initWithStyle:reuseIdentifier:specifier:](&v20, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  if (v9)
  {
    v10 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BDF6D50]);
    scrollView = v9->_scrollView;
    v9->_scrollView = v10;

    -[UIScrollView setAlwaysBounceVertical:](v9->_scrollView, "setAlwaysBounceVertical:", 1);
    -[TUIReportToAppleAdditionalDetailsTextViewTableCell addSubview:](v9, "addSubview:", v9->_scrollView);
    v12 = (int)*MEMORY[0x24BE75788];
    objc_msgSend(*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12), "removeFromSuperview");
    objc_msgSend(*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12), "setHidden:", 1);
    v13 = objc_opt_new();
    v14 = *(Class *)((char *)&v9->super.super.super.super.super.super.isa + v12);
    *(Class *)((char *)&v9->super.super.super.super.super.super.isa + v12) = (Class)v13;

    objc_msgSend(*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12), "setCell:", v9);
    objc_msgSend(*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12), "setDelegate:", v9);
    v15 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
    objc_msgSend(v15, "systemFontOfSize:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12), "setFont:", v16);

    -[UIScrollView addSubview:](v9->_scrollView, "addSubview:", *(Class *)((char *)&v9->super.super.super.super.super.super.isa + v12));
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75D50]);
    v17 = objc_claimAutoreleasedReturnValue();
    placeholderText = v9->_placeholderText;
    v9->_placeholderText = (NSString *)v17;

    objc_msgSend(*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12), "setText:", v9->_placeholderText);
    -[TUIReportToAppleAdditionalDetailsTextViewTableCell setPlaceholderDisplayed:](v9, "setPlaceholderDisplayed:", 1);
  }

  return v9;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIReportToAppleAdditionalDetailsTextViewTableCell;
  -[PSTextViewTableCell layoutSubviews](&v6, sel_layoutSubviews);
  v3 = (int)*MEMORY[0x24BE75788];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "frame");
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "frame");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v4, v5);
  -[TUIReportToAppleAdditionalDetailsTextViewTableCell _updateInterfaceColorForTextView](self, "_updateInterfaceColorForTextView");
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIReportToAppleAdditionalDetailsTextViewTableCell;
  -[PSTextViewTableCell resignFirstResponder](&v4, sel_resignFirstResponder);
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75788]), "resignFirstResponder");
}

- (void)setPlaceholderDisplayed:(BOOL)a3
{
  id v4;

  self->_placeholderDisplayed = a3;
  if (a3)
    objc_msgSend(MEMORY[0x24BDF6950], "placeholderTextColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75788]), "setTextColor:", v4);

}

- (void)textContentView:(id)a3 didChangeSize:(CGSize)a4
{
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", a3, a4.width, a4.height);
}

- (BOOL)textContentView:(id)a3 shouldChangeSizeForContentSize:(CGSize)a4
{
  return 1;
}

- (BOOL)textContentView:(id)a3 shouldScrollForPendingContentSize:(CGSize)a4
{
  return 0;
}

- (void)textContentViewDidChange:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  id v8;
  CGRect v9;

  v8 = a3;
  objc_msgSend(v8, "rectForScrollToVisible");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  if (!CGRectIsEmpty(v9))
  {
    objc_msgSend(v8, "convertRect:toView:", self->_scrollView, x, y, width, height);
    -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 1);
  }

}

- (BOOL)textContentViewShouldBeginEditing:(id)a3
{
  _BOOL4 placeholderDisplayed;
  void *v5;
  const __CFString *placeholderText;
  void *v7;
  uint64_t v8;

  placeholderDisplayed = self->_placeholderDisplayed;
  if (self->_placeholderDisplayed)
  {
    v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75788]);
    placeholderText = &stru_251A5E438;
  }
  else
  {
    objc_msgSend(a3, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
      return 1;
    placeholderText = (const __CFString *)self->_placeholderText;
    v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75788]);
  }
  objc_msgSend(v5, "setText:", placeholderText);
  -[TUIReportToAppleAdditionalDetailsTextViewTableCell setPlaceholderDisplayed:](self, "setPlaceholderDisplayed:", !placeholderDisplayed);
  return 1;
}

- (void)_updateInterfaceColorForTextView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[TUIReportToAppleAdditionalDetailsTextViewTableCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "tableCellGroupedBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75788]), "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x24BDF6950], "tableCellGroupedBackgroundColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75788]), "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  }
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIScrollView setBackgroundColor:](self->_scrollView, "setBackgroundColor:", v7);

}

- (BOOL)placeholderDisplayed
{
  return self->_placeholderDisplayed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
