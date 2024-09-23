@implementation TUIEmojiVariantCell

- (TUIEmojiVariantCell)initWithFrame:(CGRect)a3 token:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  TUIEmojiVariantCell *v11;
  TUIEmojiVariantCell *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  UIView *backgroundView;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _TUIKeyboardEmojiDraggableView *labelView;
  _TUIKeyboardEmojiDraggableView *v25;
  void *v26;
  _TUIKeyboardEmojiDraggableView *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v33.receiver = self;
  v33.super_class = (Class)TUIEmojiVariantCell;
  v11 = -[TUIEmojiVariantCell initWithFrame:](&v33, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_emojiToken, a4);
    v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v18 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], v15, v16, v17);
    backgroundView = v12->_backgroundView;
    v12->_backgroundView = (UIView *)v18;

    -[UIView layer](v12->_backgroundView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadius:", 5.0);

    -[UIView layer](v12->_backgroundView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMasksToBounds:", 1);

    -[TUIEmojiVariantCell tintColor](v12, "tintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12->_backgroundView, "setBackgroundColor:", v22);

    -[TUIEmojiVariantCell addSubview:](v12, "addSubview:", v12->_backgroundView);
    objc_msgSend((id)objc_opt_class(), "_createDraggableEmojiLabel");
    v23 = objc_claimAutoreleasedReturnValue();
    labelView = v12->_labelView;
    v12->_labelView = (_TUIKeyboardEmojiDraggableView *)v23;

    v25 = v12->_labelView;
    if (v25)
    {
      -[_TUIKeyboardEmojiDraggableView setDelegate:](v25, "setDelegate:", v12);
    }
    else
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v14, v15, v16, v17);
      objc_msgSend(v26, "setTextAlignment:", 1);
      v27 = v12->_labelView;
      v12->_labelView = (_TUIKeyboardEmojiDraggableView *)v26;

    }
    -[TUIEmojiVariantCell addSubview:](v12, "addSubview:", v12->_labelView);
    v28 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v10, "string");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUIEmojiVariantSelectorView emojiTextAttributes](TUIEmojiVariantSelectorView, "emojiTextAttributes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v28, "initWithString:attributes:", v29, v30);

    -[_TUIKeyboardEmojiDraggableView setAttributedText:](v12->_labelView, "setAttributedText:", v31);
    -[TUIEmojiVariantCell setHighlighted:](v12, "setHighlighted:", 0);

  }
  return v12;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUIEmojiVariantCell;
  -[TUIEmojiVariantCell layoutSubviews](&v11, sel_layoutSubviews);
  -[TUIEmojiVariantCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[_TUIKeyboardEmojiDraggableView setFrame:](self->_labelView, "setFrame:", v4, v6, v8, v10);
}

- (void)setHighlighted:(BOOL)a3
{
  -[UIView setHidden:](self->_backgroundView, "setHidden:", !a3);
}

- (void)dragWillBegin:(id)a3
{
  TUIEmojiVariantSelectorView **p_variantSelectorView;
  void *v4;
  id v5;
  id WeakRetained;

  p_variantSelectorView = &self->_variantSelectorView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_variantSelectorView);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)p_variantSelectorView);
  objc_msgSend(v4, "dragAndDropWillBegin:", v5);

}

- (void)dragDidEnd:(id)a3 withOperation:(unint64_t)a4
{
  TUIEmojiVariantSelectorView **p_variantSelectorView;
  void *v5;
  id v6;
  id WeakRetained;

  p_variantSelectorView = &self->_variantSelectorView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_variantSelectorView);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)p_variantSelectorView);
  objc_msgSend(v5, "dragAndDropDidEnd:", v6);

}

- (_TUIKeyboardEmojiDraggableView)labelView
{
  return self->_labelView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (EMFEmojiToken)emojiToken
{
  return self->_emojiToken;
}

- (TUIEmojiVariantSelectorView)variantSelectorView
{
  return (TUIEmojiVariantSelectorView *)objc_loadWeakRetained((id *)&self->_variantSelectorView);
}

- (void)setVariantSelectorView:(id)a3
{
  objc_storeWeak((id *)&self->_variantSelectorView, a3);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_variantSelectorView);
  objc_storeStrong((id *)&self->_emojiToken, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

+ (id)_createDraggableEmojiLabel
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("UIKeyboardEmojiDraggableView"))), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "setDragEnabled:", _os_feature_enabled_impl());
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
