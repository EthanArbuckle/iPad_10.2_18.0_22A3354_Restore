@implementation _TVSearchBar

+ (id)_listItemTextColor
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t *v5;

  if (_listItemTextColor___once != -1)
    dispatch_once(&_listItemTextColor___once, &__block_literal_global_7);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  v5 = &_listItemTextColor___lightThemeColor;
  if (v4 == 2)
    v5 = &_listItemTextColor___darkThemeColor;
  return (id)*v5;
}

+ (id)_listItemSelectedOverlayFillColor
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t *v5;

  if (_listItemSelectedOverlayFillColor___once != -1)
    dispatch_once(&_listItemSelectedOverlayFillColor___once, &__block_literal_global_2);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  v5 = &_listItemSelectedOverlayFillColor___lightThemeColor;
  if (v4 == 2)
    v5 = &_listItemSelectedOverlayFillColor___darkThemeColor;
  return (id)*v5;
}

- (_TVSearchBar)initWithFrame:(CGRect)a3
{
  _TVSearchBar *v3;
  id v4;
  uint64_t v5;
  UITextField *textField;
  UITextField *v7;
  void *v8;
  UIActivityIndicatorView *v9;
  UIActivityIndicatorView *activityIndicatorView;
  UIActivityIndicatorView *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_TVSearchBar;
  v3 = -[_TVSearchBar initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6EA8]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    textField = v3->_textField;
    v3->_textField = (UITextField *)v5;

    -[UITextField setAdjustsFontForContentSizeCategory:](v3->_textField, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextField setBorderStyle:](v3->_textField, "setBorderStyle:", 3);
    v7 = v3->_textField;
    objc_msgSend((id)objc_opt_class(), "_listItemSelectedOverlayFillColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[_TVSearchBar addSubview:](v3, "addSubview:", v3->_textField);
    v9 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x24BDF67D0]);
    activityIndicatorView = v3->_activityIndicatorView;
    v3->_activityIndicatorView = v9;

    v11 = v3->_activityIndicatorView;
    objc_msgSend((id)objc_opt_class(), "_listItemTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v11, "setColor:", v12);

    -[UIActivityIndicatorView setHidesWhenStopped:](v3->_activityIndicatorView, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView stopAnimating](v3->_activityIndicatorView, "stopAnimating");
    -[_TVSearchBar addSubview:](v3, "addSubview:", v3->_activityIndicatorView);
  }
  return v3;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_TVSearchBar textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[_TVSearchBar textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_TVSearchBar;
  v6 = a3;
  -[_TVSearchBar didUpdateFocusInContext:withAnimationCoordinator:](&v12, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView", v12.receiver, v12.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isDescendantOfView:", self);
  -[_TVSearchBar textField](self, "textField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setBackgroundColor:", 0);

    -[_TVSearchBar becomeFirstResponder](self, "becomeFirstResponder");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_listItemSelectedOverlayFillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

    -[_TVSearchBar resignFirstResponder](self, "resignFirstResponder");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
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
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  width = a3.width;
  -[UIView tv_padding](self, "tv_padding", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView tv_itemWidth](self, "tv_itemWidth");
  v14 = fmax(v13, width - (v8 + v12));
  if (v13 == 0.0)
    v15 = v14;
  else
    v15 = v13;
  -[_TVSearchBar textField](self, "textField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeThatFits:", v15, 0.0);
  v18 = v17;

  v19 = v12 + v8 + v15 + 8.0;
  v20 = v10 + v6 + v18 + 24.0;
  result.height = v20;
  result.width = v19;
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
  void *v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  float v19;
  CGFloat v20;
  float v21;
  CGFloat v22;
  void *v23;
  double MaxX;
  double Height;
  double v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  -[_TVSearchBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIView tv_padding](self, "tv_padding");
  v8 = v7;
  v10 = v9;
  -[UIView tv_itemWidth](self, "tv_itemWidth");
  v12 = fmax(v11, v4 - (v8 + v10));
  if (v11 == 0.0)
    v13 = v12;
  else
    v13 = v11;
  -[_TVSearchBar textField](self, "textField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", v13, 0.0);
  v16 = v15;

  v17 = v13 + 8.0;
  v18 = v16 + 24.0;
  v19 = (v4 - v17) * 0.5;
  v20 = floorf(v19);
  v21 = (v6 - v18) * 0.5;
  v22 = floorf(v21);
  -[_TVSearchBar textField](self, "textField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v20, v22, v17, v18);

  v28.origin.x = v20;
  v28.origin.y = v22;
  v28.size.width = v17;
  v28.size.height = v18;
  MaxX = CGRectGetMaxX(v28);
  v29.origin.x = v20;
  v29.origin.y = v22;
  v29.size.width = v17;
  v29.size.height = v18;
  Height = CGRectGetHeight(v29);
  v30.origin.x = v20;
  v30.origin.y = v22;
  v30.size.width = v17;
  v30.size.height = v18;
  v26 = CGRectGetHeight(v30);
  -[_TVSearchBar activityIndicatorView](self, "activityIndicatorView");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", MaxX, 0.0, Height, v26);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v9.receiver = self;
  v9.super_class = (Class)_TVSearchBar;
  -[_TVSearchBar keyCommands](&v9, sel_keyCommands);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel__submit_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, sel__insertSpace_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  return v5;
}

- (BOOL)hasText
{
  void *v2;
  uint64_t v3;

  -[_TVSearchBar text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3 != 0;
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[_TVSearchBar text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v4, "appendString:", v5);
  objc_msgSend(v4, "appendString:", v9);
  -[_TVSearchBar setText:](self, "setText:", v4);
  -[_TVSearchBar delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_TVSearchBar delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchBarDidChangeText:", self);

  }
}

- (void)deleteBackward
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  if (-[_TVSearchBar hasText](self, "hasText"))
  {
    -[_TVSearchBar text](self, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[_TVSearchBar setText:](self, "setText:", v7);
    -[_TVSearchBar delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[_TVSearchBar delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchBarDidChangeText:", self);

    }
  }
}

- (void)_submit:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[_TVSearchBar delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_TVSearchBar delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchBarDidSubmit:", self);

  }
}

- (void)_insertSpace:(id)a3
{
  -[_TVSearchBar insertText:](self, "insertText:", CFSTR(" "));
}

- (UITextField)textField
{
  return self->_textField;
}

- (_TVSearchBarDelegate)delegate
{
  return (_TVSearchBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
