@implementation UIKeyboardEmojiVariantViewCell

- (UIKeyboardEmojiVariantViewCell)initWithFrame:(CGRect)a3
{
  UIKeyboardEmojiVariantViewCell *v3;
  UIKeyboardEmojiDraggableView *v4;
  UIKeyboardEmojiDraggableView *labelView;
  void *v6;
  UIView *v7;
  UIView *backgroundView;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardEmojiVariantViewCell;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[UIKeyboardEmojiDraggableView initWithFrame:]([UIKeyboardEmojiDraggableView alloc], "initWithFrame:", 3.0, 3.0, 32.0, 32.0);
    labelView = v3->_labelView;
    v3->_labelView = v4;

    objc_msgSend(off_1E167A828, "systemFontOfSize:", 32.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiDraggableView setFont:](v3->_labelView, "setFont:", v6);

    -[UIKeyboardEmojiDraggableView setDragEnabled:](v3->_labelView, "setDragEnabled:", 1);
    -[UIKeyboardEmojiDraggableView setDelegate:](v3->_labelView, "setDelegate:", v3);
    v7 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 38.0, 38.0);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v7;

    -[UIView layer](v3->_backgroundView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 6.0);

    -[UIView tintColor](v3, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_backgroundView, "setBackgroundColor:", v10);

    -[UIView setHidden:](v3->_backgroundView, "setHidden:", 1);
    -[UIView addSubview:](v3, "addSubview:", v3->_backgroundView);
    -[UIView addSubview:](v3, "addSubview:", v3->_labelView);
  }
  return v3;
}

- (NSString)emoji
{
  return -[UIKeyboardEmojiDraggableView text](self->_labelView, "text");
}

- (void)setEmoji:(id)a3
{
  -[UIKeyboardEmojiDraggableView setText:](self->_labelView, "setText:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  -[UIView setHidden:](self->_backgroundView, "setHidden:", !a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 38.0;
  v3 = 38.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)dragWillBegin:(id)a3
{
  -[UIKeyboardEmojiVariantViewCell setHighlighted:](self, "setHighlighted:", 0);
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end
