@implementation SUTextViewCell

- (SUTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUTextViewCell *v4;
  UIScrollView *v5;
  SUTextContentView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUTextViewCell;
  v4 = -[SUTableCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BDF6D50]);
    v4->_scrollView = v5;
    -[UIScrollView setAlwaysBounceVertical:](v5, "setAlwaysBounceVertical:", 1);
    -[SUTextViewCell addSubview:](v4, "addSubview:", v4->_scrollView);
    v6 = objc_alloc_init(SUTextContentView);
    v4->_textContentView = v6;
    -[SUTextContentView setBackgroundColor:](v6, "setBackgroundColor:", -[SUTextViewCell backgroundColor](v4, "backgroundColor"));
    -[UITextContentView setFont:](v4->_textContentView, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0));
    -[UITextContentView setDelegate:](v4->_textContentView, "setDelegate:", v4);
    -[UIScrollView addSubview:](v4->_scrollView, "addSubview:", v4->_textContentView);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_scrollView = 0;
  -[UITextContentView setDelegate:](self->_textContentView, "setDelegate:", 0);

  self->_textContentView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTextViewCell;
  -[SUTableCell dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  UIScrollView *scrollView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)SUTextViewCell;
  -[SUTableCell layoutSubviews](&v9, sel_layoutSubviews);
  scrollView = self->_scrollView;
  objc_msgSend((id)-[SUTextViewCell contentView](self, "contentView"), "frame");
  v11 = CGRectInset(v10, 10.0, 6.0);
  -[UIScrollView setFrame:](scrollView, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v5 = v4;
  v7 = v6;
  -[SUTextContentView frame](self->_textContentView, "frame");
  if (v8 >= v7)
    v7 = v8;
  -[UITextContentView setFrame:](self->_textContentView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v5, v7);
}

- (BOOL)resignFirstResponder
{
  return -[SUTextContentView resignFirstResponder](self->_textContentView, "resignFirstResponder");
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v5;

  -[SUTextContentView setBackgroundColor:](self->_textContentView, "setBackgroundColor:");
  v5.receiver = self;
  v5.super_class = (Class)SUTextViewCell;
  -[SUTextViewCell setBackgroundColor:](&v5, sel_setBackgroundColor_, a3);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUTextViewCell;
  -[SUTextViewCell setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUTextViewCell;
  -[SUTableCell setHighlighted:animated:](&v4, sel_setHighlighted_animated_, 0, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUTextViewCell;
  -[SUTableCell setSelected:animated:](&v4, sel_setSelected_animated_, 0, 0);
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
  CGRect v9;

  objc_msgSend(a3, "rectForScrollToVisible");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  if (!CGRectIsEmpty(v9))
  {
    objc_msgSend(a3, "convertRect:toView:", self->_scrollView, x, y, width, height);
    -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 1);
  }
}

- (BOOL)textContentViewShouldBeginEditing:(id)a3
{
  SUTextViewCellDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    return -[SUTextViewCellDelegate textViewCellShouldBeginEditing:](delegate, "textViewCellShouldBeginEditing:", self);
  else
    return 1;
}

- (BOOL)textContentViewShouldEndEditing:(id)a3
{
  SUTextViewCellDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    return -[SUTextViewCellDelegate textViewCellShouldEndEditing:](delegate, "textViewCellShouldEndEditing:", self);
  else
    return 1;
}

- (SUTextViewCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUTextViewCellDelegate *)a3;
}

- (SUTextContentView)textContentView
{
  return self->_textContentView;
}

@end
