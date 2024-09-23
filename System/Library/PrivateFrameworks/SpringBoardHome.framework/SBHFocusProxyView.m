@implementation SBHFocusProxyView

- (SBHFocusProxyView)initWithProxyableView:(id)a3
{
  id v4;
  SBHFocusProxyView *v5;
  SBHFocusProxyView *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v8.receiver = self;
  v8.super_class = (Class)SBHFocusProxyView;
  v5 = -[SBHFocusProxyView initWithFrame:](&v8, sel_initWithFrame_);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_proxyableView, v4);
    v6->_padding = 1.0;
    -[SBHFocusProxyView setFocusEffect:](v6, "setFocusEffect:", 0);
  }

  return v6;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;
  CGRect v5;

  v5 = CGRectInset(a3, -self->_padding, -self->_padding);
  v4.receiver = self;
  v4.super_class = (Class)SBHFocusProxyView;
  -[SBHFocusProxyView setFrame:](&v4, sel_setFrame_, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (BOOL)canBecomeFocused
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyableView);
  v3 = objc_msgSend(WeakRetained, "focusProxyCanBecomeFocused");

  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  SBHFocusProxyable **p_proxyableView;
  id v6;
  id v7;
  id WeakRetained;

  p_proxyableView = &self->_proxyableView;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxyableView);
  objc_msgSend(WeakRetained, "didUpdateFocusInContext:withAnimationCoordinator:", v7, v6);

}

- (SBHFocusProxyable)proxyableView
{
  return (SBHFocusProxyable *)objc_loadWeakRetained((id *)&self->_proxyableView);
}

- (double)padding
{
  return self->_padding;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxyableView);
}

@end
