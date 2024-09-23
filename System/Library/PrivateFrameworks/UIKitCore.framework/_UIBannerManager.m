@implementation _UIBannerManager

- (_UIBannerManager)initWithScene:(id)a3
{
  id v3;
  _UIBannerManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBannerManager;
  v3 = a3;
  v4 = -[_UIBannerManager init](&v6, sel_init);
  -[_UIBannerManager _setScene:](v4, "_setScene:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)_setScene:(id)a3
{
  UIWindowScene *v5;
  UIWindowScene *windowScene;
  void *v7;

  v5 = (UIWindowScene *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBannerManager.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene == nil || [scene isKindOfClass:[UIWindowScene class]]"));

    }
  }
  windowScene = self->_windowScene;
  self->_windowScene = v5;

}

- (UIScene)_scene
{
  return (UIScene *)self->_windowScene;
}

- (void)_createWindowIfNeeded
{
  _UIBannerWindow *v3;
  _UIBannerWindow *window;
  _UIBannerContainerView *v5;
  _UIBannerContainerView *v6;
  _UIBannerContainerView *containerView;
  _UIBannerContainerView *v8;
  void *v9;

  if (!self->_window)
  {
    v3 = objc_alloc_init(_UIBannerWindow);
    window = self->_window;
    self->_window = v3;

    -[UIWindow setWindowScene:](self->_window, "setWindowScene:", self->_windowScene);
    v5 = [_UIBannerContainerView alloc];
    v6 = -[_UIBannerContainerView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    containerView = self->_containerView;
    self->_containerView = v6;

    -[UIView setPreservesSuperviewLayoutMargins:](self->_containerView, "setPreservesSuperviewLayoutMargins:", 1);
    v8 = self->_containerView;
    -[UIWindow rootViewController](self->_window, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setView:", v8);

    -[UIWindow setHidden:](self->_window, "setHidden:", 0);
    -[UIView bounds](self->_window, "bounds");
    -[UIView setFrame:](self->_containerView, "setFrame:");
  }
}

- (id)bannerWithContent:(id)a3
{
  id v4;
  _UIBanner *v5;

  v4 = a3;
  -[_UIBannerManager _createWindowIfNeeded](self, "_createWindowIfNeeded");
  v5 = objc_alloc_init(_UIBanner);
  -[_UIBanner setContent:](v5, "setContent:", v4);

  -[_UIBanner setManager:](v5, "setManager:", self);
  return v5;
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_windowScene, a3);
}

- (_UIBannerWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (_UIBannerContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

@end
