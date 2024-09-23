@implementation SiriSharedUILatencyView

- (SiriSharedUILatencyView)initWithContentInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  SiriSharedUILatencyView *v7;
  SiriSharedUILatencyView *v8;
  SiriSharedUILatencyViewModel *v9;
  SiriSharedUILatencyViewModel *viewModel;
  objc_super v12;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v12.receiver = self;
  v12.super_class = (Class)SiriSharedUILatencyView;
  v7 = -[SiriSharedUILatencyView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_contentInsets.top = top;
    v7->_contentInsets.left = left;
    v7->_contentInsets.bottom = bottom;
    v7->_contentInsets.right = right;
    v9 = -[SiriSharedUILatencyViewModel initWithUserUtterance:shouldSuppress:]([SiriSharedUILatencyViewModel alloc], "initWithUserUtterance:shouldSuppress:", 0, 0);
    viewModel = v8->_viewModel;
    v8->_viewModel = v9;

  }
  return v8;
}

- (void)setViewModel:(id)a3
{
  int v4;
  SiriSharedUILatencyViewModel *v5;
  SiriSharedUILatencyViewModel *viewModel;
  id v7;

  v7 = a3;
  if (!-[SiriSharedUILatencyViewModel isEqualToViewModel:](self->_viewModel, "isEqualToViewModel:"))
  {
    v4 = objc_msgSend(v7, "viewShouldUpdateFromOldModel:", self->_viewModel);
    v5 = (SiriSharedUILatencyViewModel *)objc_msgSend(v7, "copy");
    viewModel = self->_viewModel;
    self->_viewModel = v5;

    if (v4)
      -[SiriSharedUILatencyView _update](self, "_update");
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SiriSharedUILatencyView _getTextFromUtteranceView](self, "_getTextFromUtteranceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
  {
    -[SiriSharedUIContentLabel sizeThatFits:](self->_utteranceView, "sizeThatFits:", width - self->_contentInsets.left - self->_contentInsets.right, height - self->_contentInsets.top - self->_contentInsets.bottom);
    v9 = self->_contentInsets.left + v8 + self->_contentInsets.right;
    v11 = v10 + self->_contentInsets.top + self->_contentInsets.bottom;
    if (v9 < width)
      width = v9;
    if (v11 < height)
      height = v11;
  }
  else
  {
    width = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v12 = width;
  v13 = height;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v12.receiver = self;
  v12.super_class = (Class)SiriSharedUILatencyView;
  -[SiriSharedUILatencyView layoutSubviews](&v12, sel_layoutSubviews);
  -[SiriSharedUILatencyView _getTextFromUtteranceView](self, "_getTextFromUtteranceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    -[SiriSharedUILatencyView bounds](self, "bounds");
    x = v13.origin.x;
    y = v13.origin.y;
    width = v13.size.width;
    height = v13.size.height;
    v9 = CGRectGetMinX(v13) + self->_contentInsets.left;
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v10 = CGRectGetMinY(v14) + self->_contentInsets.top;
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    v11 = CGRectGetWidth(v15) - (self->_contentInsets.left + self->_contentInsets.right);
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    -[SiriSharedUIContentLabel setFrame:](self->_utteranceView, "setFrame:", v9, v10, v11, CGRectGetHeight(v16) - (self->_contentInsets.top + self->_contentInsets.bottom));
  }

}

- (void)_update
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[SiriSharedUILatencyView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldDisplay");

  if (v4)
  {
    -[SiriSharedUILatencyView viewModel](self, "viewModel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userUtterance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUILatencyView _setUtterance:](self, "_setUtterance:", v5);

  }
  else
  {
    -[SiriSharedUILatencyView _clear](self, "_clear");
  }
}

- (void)_setUtterance:(id)a3
{
  id v4;
  void *v5;
  char v6;
  SiriSharedUIContentLabel *v7;
  SiriSharedUIContentLabel *utteranceView;
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    v6 = objc_msgSend(v4, "isEqualToString:", &stru_1EA89F868);
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      -[SiriSharedUILatencyView _createLabelForUtterance:](self, "_createLabelForUtterance:", v9);
      v7 = (SiriSharedUIContentLabel *)objc_claimAutoreleasedReturnValue();
      utteranceView = self->_utteranceView;
      self->_utteranceView = v7;

      -[SiriSharedUILatencyView addSubview:](self, "addSubview:", self->_utteranceView);
      -[SiriSharedUILatencyView setNeedsLayout](self, "setNeedsLayout");
      v5 = v9;
    }
  }

}

- (void)_clear
{
  SiriSharedUIContentLabel *utteranceView;

  -[SiriSharedUIContentLabel removeFromSuperview](self->_utteranceView, "removeFromSuperview");
  utteranceView = self->_utteranceView;
  self->_utteranceView = 0;

  -[SiriSharedUILatencyView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_createLabelForUtterance:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SiriSharedUILatencyView _utteranceLabel](self, "_utteranceLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUILatencyView _setTextForLabel:text:](self, "_setTextForLabel:text:", v5, v4);

  return v5;
}

- (id)_utteranceLabel
{
  SiriSharedUIContentLabel *utteranceView;
  SiriSharedUIContentLabel *v3;
  void *v5;
  void *v6;

  utteranceView = self->_utteranceView;
  if (utteranceView)
  {
    v3 = utteranceView;
  }
  else
  {
    v3 = objc_alloc_init(SiriSharedUIContentLabel);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIContentLabel setTextColor:](v3, "setTextColor:", v5);

    -[SiriSharedUILatencyView _fontForUtteranceLabel](self, "_fontForUtteranceLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIContentLabel setFont:](v3, "setFont:", v6);

    -[SiriSharedUIContentLabel setNumberOfLines:](v3, "setNumberOfLines:", 0);
  }
  return v3;
}

- (id)_getTextFromUtteranceView
{
  void *utteranceView;

  utteranceView = self->_utteranceView;
  if (utteranceView)
  {
    objc_msgSend(utteranceView, "text");
    utteranceView = (void *)objc_claimAutoreleasedReturnValue();
  }
  return utteranceView;
}

- (void)_setTextForLabel:(id)a3 text:(id)a4
{
  objc_msgSend(a3, "setText:", a4);
}

- (id)_fontForUtteranceLabel
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4A88], 1280);
}

- (void)_setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (SiriSharedUILatencyViewDelegate)delegate
{
  return (SiriSharedUILatencyViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SiriSharedUILatencyViewModel)viewModel
{
  return self->_viewModel;
}

- (SiriSharedUIContentLabel)utteranceView
{
  return self->_utteranceView;
}

- (void)setUtteranceView:(id)a3
{
  objc_storeStrong((id *)&self->_utteranceView, a3);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
