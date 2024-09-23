@implementation TUIEmojiSearchTextFieldPortalView

- (void)removeFromSuperview
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestView);
  objc_msgSend(WeakRetained, "removeFromSuperview");

  v4.receiver = self;
  v4.super_class = (Class)TUIEmojiSearchTextFieldPortalView;
  -[TUIEmojiSearchTextFieldPortalView removeFromSuperview](&v4, sel_removeFromSuperview);
}

- (void)didMoveToWindow
{
  void *v3;
  id WeakRetained;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIEmojiSearchTextFieldPortalView;
  -[TUIEmojiSearchTextFieldPortalView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[TUIEmojiSearchTextFieldPortalView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestView);
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "setHidden:", 0);

    -[_UIPortalView sourceView](self, "sourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPortalView setSourceView:](self, "setSourceView:", 0);
    -[_UIPortalView setSourceView:](self, "setSourceView:", v5);
  }
  else
  {
    objc_msgSend(WeakRetained, "setHidden:", 1);
  }

}

- (UIView)hitTestView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_hitTestView);
}

- (void)setHitTestView:(id)a3
{
  objc_storeWeak((id *)&self->_hitTestView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hitTestView);
}

@end
