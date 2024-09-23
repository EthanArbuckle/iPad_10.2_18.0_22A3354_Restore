@implementation PKPeerPaymentRecurringPaymentMemoCell

- (PKPeerPaymentRecurringPaymentMemoCell)initWithFrame:(CGRect)a3
{
  PKPeerPaymentRecurringPaymentMemoCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIButton *iconButton;
  void *v10;
  UITextField *v11;
  UITextField *textField;
  UITextField *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentRecurringPaymentMemoCell;
  v3 = -[PKPeerPaymentRecurringPaymentMemoCell initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3428];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __55__PKPeerPaymentRecurringPaymentMemoCell_initWithFrame___block_invoke;
    v20 = &unk_1E3E62BD0;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v6, "actionWithHandler:", &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttonWithConfiguration:primaryAction:", v5, v7, v17, v18, v19, v20);
    v8 = objc_claimAutoreleasedReturnValue();
    iconButton = v3->_iconButton;
    v3->_iconButton = (UIButton *)v8;

    -[PKPeerPaymentRecurringPaymentMemoCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_iconButton);

    v11 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    textField = v3->_textField;
    v3->_textField = v11;

    -[UITextField setDelegate:](v3->_textField, "setDelegate:", v3);
    -[UITextField setClearButtonMode:](v3->_textField, "setClearButtonMode:", 1);
    -[UITextField setReturnKeyType:](v3->_textField, "setReturnKeyType:", 9);
    v13 = v3->_textField;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v13, "setFont:", v14);

    -[PKPeerPaymentRecurringPaymentMemoCell contentView](v3, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v3->_textField);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __55__PKPeerPaymentRecurringPaymentMemoCell_initWithFrame___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[111], "resignFirstResponder");
    v2 = objc_loadWeakRetained(v3 + 113);
    objc_msgSend(v2, "memoIconWasTapped");

    WeakRetained = v3;
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentRecurringPaymentMemoCell;
  -[PKPeerPaymentRecurringPaymentMemoCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PKPeerPaymentRecurringPaymentMemoCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKPeerPaymentRecurringPaymentMemoCell _layoutWithBounds:](self, "_layoutWithBounds:", v5, v7, v9, v11);
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  uint64_t v9;
  UIButton *iconButton;
  UILabel *emojiLabel;
  int v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect slice;
  CGSize result;
  CGRect v22;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UITextField sizeThatFits:](self->_textField, "sizeThatFits:", a3.size.width, a3.size.height);
  v8 = fmax(v7 + 16.0, 61.0);
  memset(&slice, 0, sizeof(slice));
  if (-[PKPeerPaymentRecurringPaymentMemoCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v9 = 2;
  else
    v9 = 0x200000000;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = v8;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = v8;
  CGRectDivide(v22, &slice, &v19, 8.0, CGRectMinYEdge);
  CGRectDivide(v19, &slice, &v19, 8.0, CGRectMaxYEdge);
  CGRectDivide(v19, &slice, &v19, 16.0, (CGRectEdge)v9);
  CGRectDivide(v19, &slice, &v19, 16.0, HIDWORD(v9));
  if (-[PKPeerPaymentRecurringPaymentMemoRowItem hasIcon](self->_item, "hasIcon")
    || -[PKPeerPaymentRecurringPaymentDetailRowItem isEditable](self->_item, "isEditable"))
  {
    CGRectDivide(v19, &slice, &v19, 45.0, CGRectMinXEdge);
    iconButton = self->_iconButton;
    PKSizeAlignedInRect();
    -[UIButton setFrame:](iconButton, "setFrame:");
    emojiLabel = self->_emojiLabel;
    -[UIButton bounds](self->_iconButton, "bounds");
    -[UILabel setFrame:](emojiLabel, "setFrame:");
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  -[UIButton setHidden:](self->_iconButton, "setHidden:", v12 ^ 1u);
  -[UILabel setHidden:](self->_emojiLabel, "setHidden:", v12 ^ 1u);
  if (-[PKPeerPaymentRecurringPaymentDetailRowItem isEditable](self->_item, "isEditable")
    || ((-[PKPeerPaymentRecurringPaymentMemoRowItem memo](self->_item, "memo"),
         v13 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v13, "text"),
         v14 = (void *)objc_claimAutoreleasedReturnValue(),
         !objc_msgSend(v14, "length"))
      ? (v15 = v12)
      : (v15 = 0),
        v14,
        v13,
        (v15 & 1) == 0))
  {
    if (v12)
      CGRectDivide(v19, &slice, &v19, 16.0, CGRectMinXEdge);
    -[UITextField setFrame:](self->_textField, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  -[UITextField setHidden:](self->_textField, "setHidden:", v16);
  v17 = width;
  v18 = v8;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPeerPaymentRecurringPaymentMemoCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setItem:(id)a3
{
  PKPeerPaymentRecurringPaymentMemoRowItem **p_item;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *emojiLabel;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UITextField *textField;
  void *v26;
  uint64_t v27;
  UITextField *v28;
  __CFString *v29;
  void *v30;
  UITextField *v31;
  void *v32;
  id v33;

  v33 = a3;
  p_item = &self->_item;
  objc_storeStrong((id *)&self->_item, a3);
  -[PKPeerPaymentRecurringPaymentMemoRowItem memo](self->_item, "memo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton configuration](self->_iconButton, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", 6.0);
  if (-[PKPeerPaymentRecurringPaymentMemoRowItem hasIcon](self->_item, "hasIcon"))
  {
    objc_msgSend(v8, "setImage:", 0);
    PKPeerPaymentMessageColorFromSemanticColor(objc_msgSend(v6, "color"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    if (!self->_emojiLabel)
    {
      v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      emojiLabel = self->_emojiLabel;
      self->_emojiLabel = v10;

      -[UILabel setTextAlignment:](self->_emojiLabel, "setTextAlignment:", 1);
      v12 = self->_emojiLabel;
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 24.75);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v12, "setFont:", v13);

      -[UIButton addSubview:](self->_iconButton, "addSubview:", self->_emojiLabel);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 27.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configurationWithHierarchicalColor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurationByApplyingConfiguration:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("plus"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v19);
    objc_msgSend(v8, "setImageContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v20);

  }
  -[UIButton setConfiguration:](self->_iconButton, "setConfiguration:", v7);
  v21 = self->_emojiLabel;
  objc_msgSend(v6, "emoji");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v21, "setText:", v22);

  objc_msgSend(v6, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  textField = self->_textField;
  if (v24)
    objc_msgSend(v6, "text");
  else
    -[PKPeerPaymentRecurringPaymentMemoRowItem suggestedText](*p_item, "suggestedText");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](textField, "setText:", v26);

  v27 = -[PKPeerPaymentRecurringPaymentDetailRowItem isEditable](*p_item, "isEditable");
  -[UIButton setUserInteractionEnabled:](self->_iconButton, "setUserInteractionEnabled:", v27);
  -[UITextField setUserInteractionEnabled:](self->_textField, "setUserInteractionEnabled:", v27);
  v28 = self->_textField;
  if ((_DWORD)v27)
    v29 = CFSTR("DETAILS_MEMO_TEXT_PLACEHOLDER_EDITING");
  else
    v29 = CFSTR("DETAILS_MEMO_TEXT_PLACEHOLDER_NOT_EDITING");
  PKLocalizedPeerPaymentRecurringString(&v29->isa);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](v28, "setPlaceholder:", v30);

  v31 = self->_textField;
  objc_msgSend(v33, "titleColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](v31, "setTextColor:", v32);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id WeakRetained;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "length");
  if (v12 <= 0x24)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "memoTextWasUpdated:", v11);

  }
  return v12 < 0x25;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "memoTextWasUpdated:", 0);

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  return -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (PKPeerPaymentRecurringPaymentMemoRowItem)item
{
  return self->_item;
}

- (PKPeerPaymentRecurringPaymentMemoCellDelegate)delegate
{
  return (PKPeerPaymentRecurringPaymentMemoCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_iconButton, 0);
  objc_storeStrong((id *)&self->_emojiLabel, 0);
}

@end
