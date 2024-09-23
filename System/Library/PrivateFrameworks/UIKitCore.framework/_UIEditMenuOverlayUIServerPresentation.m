@implementation _UIEditMenuOverlayUIServerPresentation

- (id)containerView
{
  return self->_menuContainerView;
}

- (BOOL)canPresentEditMenu
{
  return 1;
}

- (void)displayMenuForConfiguration:(id)a3 originContext:(id)a4 inDisplayDelegate:(id)a5
{
  _UIOEditMenuPresentationConfiguration *v8;
  _UIOServerActionOriginContext *v9;
  _UIOEditMenuPresentationConfiguration *presentationConfiguration;
  _UIOEditMenuPresentationConfiguration *v11;
  id v12;
  _UIOServerActionOriginContext *originContext;
  _UIOServerActionOriginContext *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = (_UIOEditMenuPresentationConfiguration *)a3;
  v9 = (_UIOServerActionOriginContext *)a4;
  presentationConfiguration = self->_presentationConfiguration;
  self->_presentationConfiguration = v8;
  v11 = v8;
  v12 = a5;

  originContext = self->_originContext;
  self->_originContext = v9;
  v14 = v9;

  objc_storeWeak((id *)&self->_displayDelegate, v12);
  -[_UIOEditMenuPresentationConfiguration identifier](v11, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", v15, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPreferredArrowDirection:", -[_UIOEditMenuPresentationConfiguration preferredArrowDirection](v11, "preferredArrowDirection"));
  -[_UIOEditMenuPresentationConfiguration menu](v11, "menu");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)_UIEditMenuOverlayUIServerPresentation;
  -[_UIEditMenuContentPresentation displayMenu:configuration:](&v18, sel_displayMenu_configuration_, v17, v16);

}

- (id)configureContainerViewWithConfiguration:(id)a3
{
  _UIEditMenuContainerView *menuContainerView;
  id WeakRetained;
  void *v6;
  _UIEditMenuContainerView *v7;
  _UIEditMenuContainerView *v8;

  menuContainerView = self->_menuContainerView;
  if (!menuContainerView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_displayDelegate);
    objc_msgSend(WeakRetained, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[_UIEditMenuContainerView initWithPresentation:enablePassthrough:]([_UIEditMenuContainerView alloc], "initWithPresentation:enablePassthrough:", self, 1);
    objc_msgSend(v6, "bounds");
    -[_UIEditMenuContainerView setFrame:](v7, "setFrame:");
    -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    objc_msgSend(v6, "addSubview:", v7);
    v8 = self->_menuContainerView;
    self->_menuContainerView = v7;

    menuContainerView = self->_menuContainerView;
  }
  return menuContainerView;
}

- (void)teardownContainerView
{
  _UIEditMenuContainerView *menuContainerView;

  -[UIView removeFromSuperview](self->_menuContainerView, "removeFromSuperview");
  menuContainerView = self->_menuContainerView;
  self->_menuContainerView = 0;

}

- (int64_t)initialUserInterfaceStyle
{
  return -[_UIOEditMenuPresentationConfiguration initialUserInterfaceStyle](self->_presentationConfiguration, "initialUserInterfaceStyle");
}

- (BOOL)wantsPasteTouchAuthenticationInEditMenuListView:(id)a3
{
  return 0;
}

- (_UIOEditMenuPresentationConfiguration)presentationConfiguration
{
  return self->_presentationConfiguration;
}

- (_UIOServerActionOriginContext)originContext
{
  return self->_originContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originContext, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
  objc_destroyWeak((id *)&self->_displayDelegate);
  objc_storeStrong((id *)&self->_menuContainerView, 0);
}

@end
