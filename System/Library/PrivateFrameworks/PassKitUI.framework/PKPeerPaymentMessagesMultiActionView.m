@implementation PKPeerPaymentMessagesMultiActionView

- (PKPeerPaymentMessagesMultiActionView)init
{
  PKPeerPaymentMessagesMultiActionView *v2;
  PKPeerPaymentMessagesMultiActionView *v3;
  void *v4;
  uint64_t v5;
  UIButton *centerButton;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PKPeerPaymentMessagesRoundedRectangleButton *leadingButton;
  uint64_t v13;
  PKPeerPaymentMessagesRoundedRectangleButton *trailingButton;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentMessagesMultiActionView;
  v2 = -[PKPeerPaymentMessagesMultiActionView init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesMultiActionView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PKPeerPaymentMessagesMultiActionView _secondaryButton](v3, "_secondaryButton");
    v5 = objc_claimAutoreleasedReturnValue();
    centerButton = v3->_centerButton;
    v3->_centerButton = (UIButton *)v5;

    v7 = objc_alloc(MEMORY[0x1E0CD2780]);
    v8 = (void *)objc_msgSend(v7, "initWithType:", *MEMORY[0x1E0CD2C88]);
    objc_msgSend(v8, "setName:", CFSTR("gaussianBlur"));
    -[UIButton layer](v3->_centerButton, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v10);

    -[PKPeerPaymentMessagesMultiActionView addSubview:](v3, "addSubview:", v3->_centerButton);
    -[PKPeerPaymentMessagesMultiActionView _primaryButton](v3, "_primaryButton");
    v11 = objc_claimAutoreleasedReturnValue();
    leadingButton = v3->_leadingButton;
    v3->_leadingButton = (PKPeerPaymentMessagesRoundedRectangleButton *)v11;

    -[PKPeerPaymentMessagesMultiActionView addSubview:](v3, "addSubview:", v3->_leadingButton);
    -[PKPeerPaymentMessagesMultiActionView _primaryButton](v3, "_primaryButton");
    v13 = objc_claimAutoreleasedReturnValue();
    trailingButton = v3->_trailingButton;
    v3->_trailingButton = (PKPeerPaymentMessagesRoundedRectangleButton *)v13;

    -[PKPeerPaymentMessagesMultiActionView addSubview:](v3, "addSubview:", v3->_trailingButton);
    -[PKPeerPaymentMessagesMultiActionView setCenterButtonVisible:animated:](v3, "setCenterButtonVisible:animated:", 1, 0);

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3 forStyle:(unint64_t)a4
{
  double height;
  double width;
  _BOOL4 v7;
  BOOL v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self->_leadingAction)
    v7 = 1;
  else
    v7 = self->_trailingAction != 0;
  if (a4)
    v8 = self->_centerAction == 0;
  else
    v8 = 1;
  v9 = v8;
  if (PKIsPad())
    v10 = 178.0;
  else
    v10 = 168.0;
  if (PKIsPad())
    v11 = 163.0;
  else
    v11 = 153.0;
  if (v10 + v11 < width)
  {
    if (PKIsPad())
      v12 = 178.0;
    else
      v12 = 168.0;
    if (PKIsPad())
      v13 = 163.0;
    else
      v13 = 153.0;
    width = v12 + v13;
  }
  -[PKPeerPaymentMessagesMultiActionView _heightForPrimaryButtonForAvailableSize:](self, "_heightForPrimaryButtonForAvailableSize:", width, height);
  v15 = v14;
  -[UIButton sizeThatFits:](self->_centerButton, "sizeThatFits:", width, height - v14);
  v17 = v16 + 0.0;
  if (v9)
    v17 = 0.0;
  v18 = v15 + 0.0;
  if (!v7)
    v18 = v17;
  v19 = v15 + 16.0 + v16;
  if (((!v7 | v9) & 1) != 0)
    v19 = v18;
  v20 = width;
  result.height = v19;
  result.width = v20;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPeerPaymentMessagesMultiActionView sizeThatFits:forStyle:](self, "sizeThatFits:forStyle:", self->_style, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  int v19;
  unint64_t leadingAction;
  unint64_t trailingAction;
  CGRectEdge v22;
  unint64_t centerAction;
  double v24;
  CGFloat v25;
  double Width;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  PKPeerPaymentMessagesRoundedRectangleButton **p_trailingButton;
  CGRect *p_slice;
  double y;
  double v34;
  CGFloat v35;
  UIButton *centerButton;
  CGRect v37;
  CGRect remainder;
  CGRect slice;
  objc_super v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v40.receiver = self;
  v40.super_class = (Class)PKPeerPaymentMessagesMultiActionView;
  -[PKPeerPaymentMessagesMultiActionView layoutSubviews](&v40, sel_layoutSubviews);
  -[PKPeerPaymentMessagesMultiActionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPeerPaymentMessagesMultiActionView sizeThatFits:](self, "sizeThatFits:", v7, v9);
  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  CGRectGetHeight(v41);
  if (self->_usesFlexibleButtonWidth)
  {
    v42.origin.x = v4;
    v42.origin.y = v6;
    v42.size.width = v8;
    v42.size.height = v10;
    CGRectGetWidth(v42);
  }
  memset(&slice, 0, sizeof(slice));
  UIRectCenteredXInRect();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  remainder.origin.x = v11;
  remainder.origin.y = v13;
  remainder.size.width = v15;
  remainder.size.height = v17;
  v19 = -[PKPeerPaymentMessagesMultiActionView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  leadingAction = self->_leadingAction;
  trailingAction = self->_trailingAction;
  if (v19)
    v22 = CGRectMaxXEdge;
  else
    v22 = CGRectMinXEdge;
  centerAction = self->_centerAction;
  memset(&v37, 0, sizeof(v37));
  -[PKPeerPaymentMessagesMultiActionView _heightForPrimaryButtonForAvailableSize:](self, "_heightForPrimaryButtonForAvailableSize:", v16, v18, 0);
  v25 = v24;
  v43.origin.x = v12;
  v43.origin.y = v14;
  v43.size.width = v16;
  v43.size.height = v18;
  CGRectDivide(v43, &v37, &remainder, v25, CGRectMinYEdge);
  if (leadingAction && trailingAction)
  {
    Width = CGRectGetWidth(remainder);
    if (self->_usesFlexibleButtonWidth
      || (!PKIsPad() ? (v27 = 153.0) : (v27 = 163.0), v27 * 2.0 + 15.0 > Width))
    {
      PKFloatRoundToPixel();
      v29 = v28 * 0.5;
    }
    else if (PKIsPad())
    {
      v29 = 163.0;
    }
    else
    {
      v29 = 153.0;
    }
    p_slice = &slice;
    CGRectDivide(v37, &slice, &v37, v29, v22);
    -[PKPeerPaymentMessagesRoundedRectangleButton setFrame:](self->_leadingButton, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(v37, &slice, &v37, 15.0, v22);
    CGRectDivide(v37, &slice, &v37, v29, v22);
    p_trailingButton = &self->_trailingButton;
    y = slice.origin.y;
    v34 = slice.size.width;
  }
  else
  {
    if (leadingAction)
    {
      v30 = 416;
    }
    else
    {
      if (!trailingAction)
        goto LABEL_24;
      v30 = 424;
    }
    p_trailingButton = (PKPeerPaymentMessagesRoundedRectangleButton **)((char *)self + v30);
    p_slice = &v37;
    y = v37.origin.y;
    v34 = v37.size.width;
  }
  -[PKPeerPaymentMessagesRoundedRectangleButton setFrame:](*p_trailingButton, "setFrame:", p_slice->origin.x, y, v34, p_slice->size.height);
LABEL_24:
  if (centerAction)
  {
    CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMinYEdge);
    -[UIButton sizeThatFits:](self->_centerButton, "sizeThatFits:", remainder.size.width, remainder.size.height);
    CGRectDivide(remainder, &slice, &remainder, v35, CGRectMinYEdge);
    centerButton = self->_centerButton;
    PKSizeAlignedInRect();
    -[UIButton setFrame:](centerButton, "setFrame:");
  }
  -[PKPeerPaymentMessagesRoundedRectangleButton setHidden:](self->_leadingButton, "setHidden:", leadingAction == 0);
  -[PKPeerPaymentMessagesRoundedRectangleButton setHidden:](self->_trailingButton, "setHidden:", trailingAction == 0);
  -[UIButton setHidden:](self->_centerButton, "setHidden:", centerAction == 0);
}

- (void)setLeadingAction:(unint64_t)a3
{
  PKPeerPaymentMessagesRoundedRectangleButton *leadingButton;
  void *v5;
  id v6;

  self->_leadingAction = a3;
  leadingButton = self->_leadingButton;
  -[PKPeerPaymentMessagesMultiActionView _axIdentifierForAction:](self, "_axIdentifierForAction:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesRoundedRectangleButton setAccessibilityIdentifier:](leadingButton, "setAccessibilityIdentifier:", v5);

  -[PKPeerPaymentMessagesMultiActionView _titleForAction:](self, "_titleForAction:", self->_leadingAction);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesRoundedRectangleButton setTitle:forState:](self->_leadingButton, "setTitle:forState:", v6, 0);
  -[PKPeerPaymentMessagesMultiActionView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setTrailingAction:(unint64_t)a3
{
  PKPeerPaymentMessagesRoundedRectangleButton *trailingButton;
  void *v5;
  id v6;

  self->_trailingAction = a3;
  trailingButton = self->_trailingButton;
  -[PKPeerPaymentMessagesMultiActionView _axIdentifierForAction:](self, "_axIdentifierForAction:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesRoundedRectangleButton setAccessibilityIdentifier:](trailingButton, "setAccessibilityIdentifier:", v5);

  -[PKPeerPaymentMessagesMultiActionView _titleForAction:](self, "_titleForAction:", self->_trailingAction);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesRoundedRectangleButton setTitle:forState:](self->_trailingButton, "setTitle:forState:", v6, 0);
  -[PKPeerPaymentMessagesMultiActionView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setCenterAction:(unint64_t)a3
{
  UIButton *centerButton;
  void *v5;
  UIButton *v6;
  void *v7;

  self->_centerAction = a3;
  centerButton = self->_centerButton;
  -[PKPeerPaymentMessagesMultiActionView _axIdentifierForAction:](self, "_axIdentifierForAction:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setAccessibilityIdentifier:](centerButton, "setAccessibilityIdentifier:", v5);

  v6 = self->_centerButton;
  -[PKPeerPaymentMessagesMultiActionView _titleForAction:](self, "_titleForAction:", self->_centerAction);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v6, "setTitle:forState:", v7, 0);

  -[PKPeerPaymentMessagesMultiActionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setActivityIndicatorVisible:(BOOL)a3 forAction:(unint64_t)a4
{
  _BOOL8 v4;
  int *v5;
  id v6;

  v4 = a3;
  v5 = &OBJC_IVAR___PKPeerPaymentMessagesMultiActionView__leadingButton;
  if (self->_leadingAction == a4
    || (v5 = &OBJC_IVAR___PKPeerPaymentMessagesMultiActionView__trailingButton, self->_trailingAction == a4))
  {
    v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
    objc_msgSend(v6, "setShowsActivityIndicator:", v4);

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[PKPeerPaymentMessagesMultiActionView setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
    -[PKPeerPaymentMessagesRoundedRectangleButton setEnabled:](self->_leadingButton, "setEnabled:", v3);
    -[PKPeerPaymentMessagesRoundedRectangleButton setEnabled:](self->_trailingButton, "setEnabled:", v3);
    -[UIButton setEnabled:](self->_centerButton, "setEnabled:", v3);
  }
}

- (void)setUsesFlexibleButtonWidth:(BOOL)a3
{
  if (self->_usesFlexibleButtonWidth != a3)
  {
    self->_usesFlexibleButtonWidth = a3;
    -[PKPeerPaymentMessagesMultiActionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_primaryButton
{
  PKPeerPaymentMessagesRoundedRectangleButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(PKPeerPaymentMessagesRoundedRectangleButton);
  -[PKPeerPaymentMessagesRoundedRectangleButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", self, sel__handleActionButton_, 64);
  +[PKPeerPaymentTheme platterColor](PKPeerPaymentTheme, "platterColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesRoundedRectangleButton setBackgroundColor:](v3, "setBackgroundColor:", v4);

  +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesRoundedRectangleButton setTitleColor:forState:](v3, "setTitleColor:forState:", v5, 0);

  +[PKPeerPaymentTheme disabledTextColor](PKPeerPaymentTheme, "disabledTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesRoundedRectangleButton setTitleColor:forState:](v3, "setTitleColor:forState:", v6, 2);

  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D8], 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessagesRoundedRectangleButton titleLabel](v3, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  return v3;
}

- (id)_secondaryButton
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0DC3518]);
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguration:", v5);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__handleActionButton_, 64);
  +[PKPeerPaymentTheme secondaryButtonTextColor](PKPeerPaymentTheme, "secondaryButtonTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:forState:", v7, 0);

  +[PKPeerPaymentTheme secondaryButtonTextPressedColor](PKPeerPaymentTheme, "secondaryButtonTextPressedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:forState:", v8, 1);

  +[PKPeerPaymentTheme disabledTextColor](PKPeerPaymentTheme, "disabledTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:forState:", v9, 2);

  objc_msgSend(v4, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v3);

  return v4;
}

- (double)_heightForPrimaryButtonForAvailableSize:(CGSize)a3
{
  return 50.0;
}

- (id)_titleForAction:(unint64_t)a3
{
  __CFString *v3;
  void *v4;

  if (a3 == 7)
  {
    PKLocalizedPeerPaymentRecurringString(CFSTR("PEER_PAYMENT_MESSAGES_ACTION_RECURRING_PAYMENT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 2)
    {
      v3 = CFSTR("PEER_PAYMENT_MESSAGES_ACTION_REQUEST");
    }
    else
    {
      if (a3 != 1)
      {
        v4 = 0;
        return v4;
      }
      v3 = CFSTR("PEER_PAYMENT_MESSAGES_ACTION_SEND");
    }
    PKLocalizedPeerPaymentString(&v3->isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_axIdentifierForAction:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return 0;
  else
    return off_1E3E6BD70[a3 - 1];
}

- (void)_handleActionButton:(id)a3
{
  PKPeerPaymentMessagesRoundedRectangleButton *v4;
  void (**actionHandler)(id, PKPeerPaymentMessagesMultiActionView *, _QWORD);
  int *v6;
  uint64_t v7;
  PKPeerPaymentMessagesRoundedRectangleButton *v8;

  v4 = (PKPeerPaymentMessagesRoundedRectangleButton *)a3;
  actionHandler = (void (**)(id, PKPeerPaymentMessagesMultiActionView *, _QWORD))self->_actionHandler;
  if (actionHandler)
  {
    v6 = &OBJC_IVAR___PKPeerPaymentMessagesMultiActionView__leadingAction;
    v8 = v4;
    if (self->_leadingButton == v4
      || (v6 = &OBJC_IVAR___PKPeerPaymentMessagesMultiActionView__trailingAction, self->_trailingButton == v4)
      || (v6 = &OBJC_IVAR___PKPeerPaymentMessagesMultiActionView__centerAction,
          (PKPeerPaymentMessagesRoundedRectangleButton *)self->_centerButton == v4))
    {
      v7 = *(uint64_t *)((char *)&self->super.super.super.isa + *v6);
    }
    else
    {
      v7 = 0;
    }
    actionHandler[2](actionHandler, self, v7);
    v4 = v8;
  }

}

- (void)setCenterButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v4 = a4;
  v5 = a3;
  -[UIButton layer](self->_centerButton, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "opacity");
  if (*(float *)&v7 != (float)v5)
  {
    if (v4)
    {
      if (v5)
      {
        v19 = 0;
        v20 = 0;
        ContentViewVisibilityAnimations(0, &v20, &v19, 0);
        v8 = v20;
        v9 = v19;
        v10 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v8);
        v11 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v9);

LABEL_6:
        LODWORD(v7) = 1.0;
        objc_msgSend(v6, "setOpacity:", v7);
        objc_msgSend(v6, "setValue:forKeyPath:", &unk_1E3FACAB0, CFSTR("filters.gaussianBlur.inputRadius"));
        goto LABEL_9;
      }
      v17 = 0;
      v18 = 0;
      ContentViewVisibilityAnimations(&v18, 0, 0, &v17);
      v12 = v18;
      v13 = v17;
      v14 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v13);
      v15 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v12);

    }
    else if (v5)
    {
      goto LABEL_6;
    }
    objc_msgSend(v6, "setValue:forKeyPath:", &unk_1E3FACAC0, CFSTR("filters.gaussianBlur.inputRadius"));
    LODWORD(v16) = 0;
    objc_msgSend(v6, "setOpacity:", v16);
  }
LABEL_9:

}

- (unint64_t)leadingAction
{
  return self->_leadingAction;
}

- (unint64_t)trailingAction
{
  return self->_trailingAction;
}

- (unint64_t)centerAction
{
  return self->_centerAction;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)usesFlexibleButtonWidth
{
  return self->_usesFlexibleButtonWidth;
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
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_trailingActivityIndicatorBackground, 0);
  objc_storeStrong((id *)&self->_leadingActivityIndicatorBackground, 0);
  objc_storeStrong((id *)&self->_trailingActivityIndicator, 0);
  objc_storeStrong((id *)&self->_leadingActivityIndicator, 0);
  objc_storeStrong((id *)&self->_centerButton, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
}

@end
