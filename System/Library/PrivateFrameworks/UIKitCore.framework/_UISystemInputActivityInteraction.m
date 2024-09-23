@implementation _UISystemInputActivityInteraction

- (void)_updateSystemInputActivityIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[_UISystemInputActivityInteraction _windowScene](self, "_windowScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISystemInputActivityInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "windowScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v9)
  {
    -[_UISystemInputActivityInteraction _teardown](self, "_teardown");
    if (v5)
    {
      objc_msgSend(v5, "_systemInputActivityManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "beginTrackingSystemInputActivity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISystemInputActivityInteraction set_systemInputActivityToken:](self, "set_systemInputActivityToken:", v7);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__updateSystemInputActivityIfNeeded, 0x1E1764CC0, v4);

      -[_UISystemInputActivityInteraction set_windowScene:](self, "set_windowScene:", v5);
    }
  }

}

- (void)_teardown
{
  void *v3;
  void *v4;

  -[_UISystemInputActivityInteraction set_windowScene:](self, "set_windowScene:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[_UISystemInputActivityInteraction _systemInputActivityToken](self, "_systemInputActivityToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[_UISystemInputActivityInteraction set_systemInputActivityToken:](self, "set_systemInputActivityToken:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[_UISystemInputActivityInteraction _teardown](self, "_teardown");
  v3.receiver = self;
  v3.super_class = (Class)_UISystemInputActivityInteraction;
  -[_UISystemInputActivityInteraction dealloc](&v3, sel_dealloc);
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  -[_UISystemInputActivityInteraction _updateSystemInputActivityIfNeeded](self, "_updateSystemInputActivityIfNeeded");
}

- (BSInvalidatable)_systemInputActivityToken
{
  return self->__systemInputActivityToken;
}

- (void)set_systemInputActivityToken:(id)a3
{
  objc_storeStrong((id *)&self->__systemInputActivityToken, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIWindowScene)_windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->__windowScene);
}

- (void)set_windowScene:(id)a3
{
  objc_storeWeak((id *)&self->__windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__windowScene);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->__systemInputActivityToken, 0);
}

@end
