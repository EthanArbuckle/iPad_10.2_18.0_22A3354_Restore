@implementation SiriUICardSnippetView

- (SiriUICardSnippetView)initWithFrame:(CGRect)a3
{
  CGFloat width;
  double y;
  double x;
  double Height;
  double v8;
  double v9;
  double v10;
  SiriUICardSnippetView *v11;
  SiriUICardSnippetView *v12;
  objc_super v14;
  CGRect v15;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Height = CGRectGetHeight(a3);
  if (Height >= 44.0)
    v8 = Height;
  else
    v8 = 44.0;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = v8;
  v9 = CGRectGetWidth(v15);
  if (v9 >= 100.0)
    v10 = v9;
  else
    v10 = 100.0;
  v14.receiver = self;
  v14.super_class = (Class)SiriUICardSnippetView;
  v11 = -[SiriUICardSnippetView initWithFrame:](&v14, sel_initWithFrame_, x, y, v10, v8);
  v12 = v11;
  if (v11)
  {
    -[SiriUICardSnippetView _setOverrideVibrancyTrait:](v11, "_setOverrideVibrancyTrait:", 1);
    -[SiriUICardSnippetView setShouldClipTopOfCard:](v12, "setShouldClipTopOfCard:", 0);
    v12->_isNavigating = 0;
  }
  return v12;
}

- (id)accessibilityIdentifier
{
  return CFSTR("SiriUICardSnippetViewAccessibilityIdentifier");
}

- (void)setIsInAmbient:(BOOL)a3
{
  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    -[SiriUICardSnippetView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  if (self->_isInAmbientInteractivity != a3)
  {
    self->_isInAmbientInteractivity = a3;
    -[SiriUICardSnippetView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)shouldAutomaticallyScaleContentInAmbient
{
  return 1;
}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double Width;
  double Height;
  double v14;
  objc_super v15;
  CGRect v16;

  -[UIView recursive_setSemanticContentAttribute:](self->_cardView, "recursive_setSemanticContentAttribute:", -[SiriUICardSnippetView semanticContentAttribute](self, "semanticContentAttribute"));
  v15.receiver = self;
  v15.super_class = (Class)SiriUICardSnippetView;
  -[SiriUICardSnippetView layoutSubviews](&v15, sel_layoutSubviews);
  -[SiriUICardSnippetView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (self->_shouldClipTopOfCard)
    v11 = -8.0;
  else
    v11 = 0.0;
  Width = CGRectGetWidth(*(CGRect *)&v3);
  v16.origin.x = v7;
  v16.origin.y = v8;
  v16.size.width = v9;
  v16.size.height = v10;
  Height = CGRectGetHeight(v16);
  v14 = 8.0;
  if (!self->_shouldClipTopOfCard)
    v14 = 0.0;
  -[UIView setFrame:](self->_cardView, "setFrame:", 0.0, v11, Width, Height + v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  double v11;
  int v12;
  const char *v13;
  uint64_t v14;
  CGSize result;

  width = a3.width;
  v14 = *MEMORY[0x24BDAC8D0];
  -[SiriUICardSnippetView dataSource](self, "dataSource", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentHeight");
  v7 = 8.0;
  if (!self->_shouldClipTopOfCard)
    v7 = 0.0;
  v8 = v6 - v7;

  if (v8 <= 0.0)
  {
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[SiriUICardSnippetView sizeThatFits:]";
      _os_log_impl(&dword_21764F000, v9, OS_LOG_TYPE_DEFAULT, "%s No card content height.", (uint8_t *)&v12, 0xCu);
    }
    v8 = 0.0;
  }
  v10 = width;
  v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setCardView:(id)a3
{
  UIView *v5;
  UIView *cardView;
  UIView *v7;

  v5 = (UIView *)a3;
  cardView = self->_cardView;
  v7 = v5;
  if (cardView != v5)
  {
    -[UIView removeFromSuperview](cardView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_cardView, a3);
    -[UIView setAccessibilityIdentifier:](self->_cardView, "setAccessibilityIdentifier:", CFSTR("SiriUICardViewAccessibilityIdentifier"));
    -[SiriUICardSnippetView addSubview:](self, "addSubview:", v7);
    -[SiriUICardSnippetView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[SiriUICardSnippetView reloadData](self, "reloadData");
    v5 = obj;
  }

}

- (void)setNavigating:(BOOL)a3
{
  self->_isNavigating = a3;
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (UIButton)backNavigationButton
{
  return 0;
}

- (BOOL)isLoading
{
  void *v2;
  char v3;

  -[SiriUICardSnippetView backingViewController](self, "backingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLoading");

  return v3;
}

- (BOOL)isHint
{
  void *v2;
  char v3;

  -[SiriUICardSnippetView backingViewController](self, "backingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHint");

  return v3;
}

- (void)_sashViewRecognizedTapGestureWithGestureRecognizer:(id)a3
{
  id v4;

  -[SiriUICardSnippetView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSnippetViewSashWasTapped:", self);

}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (BOOL)shouldClipTopOfCard
{
  return self->_shouldClipTopOfCard;
}

- (void)setShouldClipTopOfCard:(BOOL)a3
{
  self->_shouldClipTopOfCard = a3;
}

- (SiriUISnippetViewController)backingViewController
{
  return (SiriUISnippetViewController *)objc_loadWeakRetained((id *)&self->_backingViewController);
}

- (void)setBackingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_backingViewController, a3);
}

- (SiriUICardSnippetViewDataSource)dataSource
{
  return (SiriUICardSnippetViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SiriUICardSnippetViewDelegate)delegate
{
  return (SiriUICardSnippetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_backingViewController);
  objc_storeStrong((id *)&self->_cardView, 0);
}

@end
