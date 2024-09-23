@implementation PKPeerPaymentMessagesNumberPadView

+ (CGSize)referenceSizeForSizeCategory:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  objc_msgSend(a1, "buttonHorizontalPaddingForSizeCategory:");
  v6 = v5;
  objc_msgSend(a1, "buttonVerticalPaddingForSizeCategory:", a3);
  v8 = v7;
  +[PKPeerPaymentNumberPadActionButton referenceSizeForSizeCategory:](PKPeerPaymentNumberPadActionButton, "referenceSizeForSizeCategory:", a3);
  v10 = v6 + v6 + v9 * 3.0;
  v12 = v8 * 3.0 + v11 * 4.0 + 16.0 + 16.0;
  result.height = v12;
  result.width = v10;
  return result;
}

+ (double)buttonVerticalPaddingForSizeCategory:(unint64_t)a3
{
  double result;
  char v5;

  if (PKIsVision())
  {
    if (a3 - 1 < 3)
      return dbl_19DF16358[a3 - 1];
  }
  else
  {
    v5 = PKIsPad();
    if (a3 == 3 && (v5 & 1) != 0)
      return 48.0;
  }
  +[PKPeerPaymentNumberPadActionButton adjustSize:forSizeCategory:](PKPeerPaymentNumberPadActionButton, "adjustSize:forSizeCategory:", a3, 12.0);
  return result;
}

+ (double)buttonHorizontalPaddingForSizeCategory:(unint64_t)a3
{
  char v4;
  double result;

  v4 = PKIsPad();
  if (a3 == 3 && (v4 & 1) != 0)
    return 36.0;
  +[PKPeerPaymentNumberPadActionButton adjustSize:forSizeCategory:](PKPeerPaymentNumberPadActionButton, "adjustSize:forSizeCategory:", a3, 24.0);
  return result;
}

- (PKPeerPaymentMessagesNumberPadView)initWithSizeCategory:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PKPeerPaymentMessagesNumberPadView *v11;
  void *v12;
  uint64_t v13;
  UIView *v14;
  UIView *buttonContainerView;
  uint64_t v16;
  PKPeerPaymentMessagesNumberPadView *v17;
  uint64_t i;
  uint64_t v19;
  PKPeerPaymentNumberPadActionButton *v20;
  objc_super v22;

  +[PKPeerPaymentMessagesNumberPadView referenceSizeForSizeCategory:](PKPeerPaymentMessagesNumberPadView, "referenceSizeForSizeCategory:");
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentMessagesNumberPadView;
  v11 = -[PKPeerPaymentMessagesNumberPadView initWithFrame:](&v22, sel_initWithFrame_, v9, v10, v6, v8);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesNumberPadView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    v13 = 1;
    -[PKPeerPaymentMessagesNumberPadView setClipsToBounds:](v11, "setClipsToBounds:", 1);
    v11->_enabled = 1;
    v11->_sizeCategory = a3;
    v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    buttonContainerView = v11->_buttonContainerView;
    v11->_buttonContainerView = v14;

    -[PKPeerPaymentMessagesNumberPadView addSubview:](v11, "addSubview:", v11->_buttonContainerView);
    v16 = 0;
    v17 = v11;
    do
    {
      for (i = 0; i != 3; ++i)
      {
        -[PKPeerPaymentMessagesNumberPadView _buttonForAction:](v11, "_buttonForAction:", v13 + i);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v17->_buttons[0][i];
        v17->_buttons[0][i] = (PKPeerPaymentNumberPadActionButton *)v19;

        -[UIView addSubview:](v11->_buttonContainerView, "addSubview:", v17->_buttons[0][i]);
      }
      ++v16;
      v17 = (PKPeerPaymentMessagesNumberPadView *)((char *)v17 + 24);
      v13 += 3;
    }
    while (v16 != 4);
  }
  return v11;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "referenceSizeForSizeCategory:", self->_sizeCategory);
  result.height = v4;
  result.width = v3;
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
  uint64_t v11;
  PKPeerPaymentNumberPadActionButton *(*buttons)[3];
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  UIView *buttonContainerView;
  CGRect v19;
  CGRect remainder;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentMessagesNumberPadView;
  -[PKPeerPaymentMessagesNumberPadView layoutSubviews](&v21, sel_layoutSubviews);
  objc_msgSend((id)objc_opt_class(), "buttonVerticalPaddingForSizeCategory:", self->_sizeCategory);
  v4 = v3;
  objc_msgSend((id)objc_opt_class(), "buttonHorizontalPaddingForSizeCategory:", self->_sizeCategory);
  v6 = v5;
  +[PKPeerPaymentNumberPadActionButton referenceSizeForSizeCategory:](PKPeerPaymentNumberPadActionButton, "referenceSizeForSizeCategory:", self->_sizeCategory);
  v8 = v7;
  v10 = v9;
  v11 = 0;
  buttons = self->_buttons;
  v13 = v6 + v7;
  v14 = v4 + v9;
  v15 = 0.0;
  do
  {
    v16 = 0;
    v17 = v6;
    do
    {
      -[PKPeerPaymentNumberPadActionButton setFrame:]((*buttons)[v16], "setFrame:", v17, v15, v8, v10);
      v17 = v13 + v17;
      ++v16;
    }
    while (v16 != 3);
    v15 = v14 + v15;
    ++v11;
    ++buttons;
  }
  while (v11 != 4);
  -[PKPeerPaymentMessagesNumberPadView bounds](self, "bounds", 0, 0, 0, 0);
  remainder = v22;
  CGRectDivide(v22, &v19, &remainder, 16.0, CGRectMinYEdge);
  CGRectDivide(remainder, &v19, &remainder, 16.0, CGRectMaxYEdge);
  buttonContainerView = self->_buttonContainerView;
  UIRectCenteredIntegralRect();
  -[UIView setFrame:](buttonContainerView, "setFrame:");
}

- (void)setSizeCategory:(unint64_t)a3
{
  uint64_t v4;
  PKPeerPaymentNumberPadActionButton *(*buttons)[3];
  uint64_t i;

  if (self->_sizeCategory != a3)
  {
    v4 = 0;
    self->_sizeCategory = a3;
    buttons = self->_buttons;
    do
    {
      for (i = 0; i != 3; ++i)
        -[PKPeerPaymentNumberPadActionButton setSizeCategory:]((*buttons)[i], "setSizeCategory:", self->_sizeCategory);
      ++v4;
      ++buttons;
    }
    while (v4 != 4);
    -[PKPeerPaymentMessagesNumberPadView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_buttonForAction:(unint64_t)a3
{
  PKPeerPaymentNumberPadActionButton *v5;
  void *v6;
  void *v7;

  v5 = -[PKPeerPaymentNumberPadActionButton initWithSizeCategory:]([PKPeerPaymentNumberPadActionButton alloc], "initWithSizeCategory:", self->_sizeCategory);
  -[PKPeerPaymentNumberPadActionButton addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, sel__handleActionButton_, 64);
  -[PKPeerPaymentNumberPadActionButton setAction:](v5, "setAction:", a3);
  +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentNumberPadActionButton setTitleColor:forState:](v5, "setTitleColor:forState:", v6, 0);

  +[PKPeerPaymentTheme disabledTextColor](PKPeerPaymentTheme, "disabledTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentNumberPadActionButton setTitleColor:forState:](v5, "setTitleColor:forState:", v7, 2);

  return v5;
}

- (void)_handleActionButton:(id)a3
{
  id v4;
  void (**actionHandler)(id, PKPeerPaymentMessagesNumberPadView *, uint64_t);
  id v6;

  v4 = a3;
  actionHandler = (void (**)(id, PKPeerPaymentMessagesNumberPadView *, uint64_t))self->_actionHandler;
  if (actionHandler && self->_enabled)
  {
    v6 = v4;
    actionHandler[2](actionHandler, self, objc_msgSend(v4, "action"));
    v4 = v6;
  }

}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong(&self->_actionHandler, 0);
  for (i = 11; i != -1; --i)
    objc_storeStrong((id *)&self->_buttons[0][i], 0);
  objc_storeStrong((id *)&self->_buttonContainerView, 0);
}

@end
