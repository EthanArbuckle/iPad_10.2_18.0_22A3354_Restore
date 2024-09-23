@implementation UIPrinterAccessoryView

- (UIPrinterAccessoryView)initWithFrame:(CGRect)a3
{
  UIPrinterAccessoryView *v3;
  uint64_t v4;
  UIButton *infoButton;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPrinterAccessoryView;
  v3 = -[UIPrinterAccessoryView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 3);
    v4 = objc_claimAutoreleasedReturnValue();
    infoButton = v3->_infoButton;
    v3->_infoButton = (UIButton *)v4;

    -[UIButton addTarget:action:forControlEvents:](v3->_infoButton, "addTarget:action:forControlEvents:", v3, sel_infoButtonPressed_, 64);
    -[UIPrinterAccessoryView addSubview:](v3, "addSubview:", v3->_infoButton);
    v3->_printerState = 0;
  }
  return v3;
}

- (void)infoButtonPressed:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[UIPrinterAccessoryView delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "printerAccessoryViewInfoButtonPressed:", self);
      v5 = v7;
    }
  }

}

- (void)setPrinterState:(int)a3
{
  void *v4;
  void *v5;
  int printerState;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (self->_printerState == a3)
    return;
  self->_printerState = a3;
  -[UIPrinterAccessoryView statusView](self, "statusView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPrinterAccessoryView statusView](self, "statusView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[UIPrinterAccessoryView setStatusView:](self, "setStatusView:", 0);
  }
  printerState = self->_printerState;
  switch(printerState)
  {
    case 4:
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 3);
      objc_msgSend(v10, "startAnimating");
LABEL_11:
      -[UIPrinterAccessoryView setStatusView:](self, "setStatusView:", v10);

      break;
    case 2:
      v7 = objc_alloc(MEMORY[0x1E0DC3890]);
      v8 = (void *)MEMORY[0x1E0DC3870];
      v9 = CFSTR("lock.open.fill");
      goto LABEL_10;
    case 1:
      v7 = objc_alloc(MEMORY[0x1E0DC3890]);
      v8 = (void *)MEMORY[0x1E0DC3870];
      v9 = CFSTR("lock.fill");
LABEL_10:
      objc_msgSend(v8, "systemImageNamed:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v7, "initWithImage:", v11);

      goto LABEL_11;
  }
  -[UIPrinterAccessoryView statusView](self, "statusView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIPrinterAccessoryView statusView](self, "statusView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterAccessoryView addSubview:](self, "addSubview:", v13);

  }
  -[UIPrinterAccessoryView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  __assert_rtn("-[UIPrinterAccessoryView layoutSubviews]", "UIPrinterBrowserViewController.m", 183, "leftView && rightView");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t i;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[UIPrinterAccessoryView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        v20 = v7;
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "frame");
        x = v28.origin.x;
        y = v28.origin.y;
        width = v28.size.width;
        height = v28.size.height;
        MinX = CGRectGetMinX(v28);
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        MaxX = CGRectGetMaxX(v29);
        v30.origin.x = x;
        v30.origin.y = y;
        v30.size.width = width;
        v30.size.height = height;
        v17 = CGRectGetHeight(v30);
        v7 = v20;
        if (MinX < v20)
          v7 = MinX;
        if (MaxX > v8)
          v8 = MaxX;
        if (v17 > v9)
          v9 = v17;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
  }

  v18 = v8 - v7;
  v19 = v9;
  result.height = v19;
  result.width = v18;
  return result;
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (void)setInfoButton:(id)a3
{
  objc_storeStrong((id *)&self->_infoButton, a3);
}

- (UIView)statusView
{
  return self->_statusView;
}

- (void)setStatusView:(id)a3
{
  objc_storeStrong((id *)&self->_statusView, a3);
}

- (UIPrinterAccessoryViewDelegate)delegate
{
  return (UIPrinterAccessoryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)printerState
{
  return self->_printerState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
}

@end
