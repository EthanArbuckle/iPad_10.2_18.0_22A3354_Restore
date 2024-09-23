@implementation _TUIAuxiliaryViewHost

- (_TUIAuxiliaryViewHost)initWithIdentifier:(id)a3 hostingController:(id)a4 viewVisibilityController:(id)a5 view:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _TUIAuxiliaryViewHost *v15;
  _TUIAuxiliaryViewHost *v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  TUICancellable *visibilityObserver;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t, int);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)_TUIAuxiliaryViewHost;
  v15 = -[_TUIAuxiliaryViewHost init](&v28, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeWeak((id *)&v16->_hostingController, v12);
    objc_storeStrong((id *)&v16->_view, a6);
    WeakRetained = objc_loadWeakRetained((id *)&v16->_hostingController);
    objc_msgSend(WeakRetained, "addProviderObserver:forIdentifier:", v16, v16->_identifier);

    objc_initWeak(&location, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUIVisibilityOptions modalAnchorOptions](TUIVisibilityOptions, "modalAnchorOptions"));
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_1182C4;
    v25 = &unk_23FF90;
    objc_copyWeak(&v26, &location);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "observeNavigationBarView:options:block:", v14, v18, &v22));
    visibilityObserver = v16->_visibilityObserver;
    v16->_visibilityObserver = (TUICancellable *)v19;

    -[_TUIAuxiliaryViewHost _updateHost](v16, "_updateHost", v22, v23, v24, v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)dealloc
{
  id WeakRetained;
  id v4;
  objc_super v5;

  if (self->_viewState)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
    objc_msgSend(WeakRetained, "runDisappearanceTransitionForViewState:", self->_viewState);

  }
  v4 = objc_loadWeakRetained((id *)&self->_hostingController);
  objc_msgSend(v4, "removeProviderObserver:forIdentifier:", self, self->_identifier);

  v5.receiver = self;
  v5.super_class = (Class)_TUIAuxiliaryViewHost;
  -[_TUIAuxiliaryViewHost dealloc](&v5, "dealloc");
}

- (void)_updatePopoverLayout
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
  objc_msgSend(WeakRetained, "updatePopoverLayoutForViewState:superview:", self->_viewState, self->_view);

}

- (void)_updateVisible:(BOOL)a3
{
  TUIHostingViewState *viewState;
  id WeakRetained;

  self->_visible = a3;
  viewState = self->_viewState;
  if (a3)
  {
    if (!viewState)
      return;
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
    objc_msgSend(WeakRetained, "runAppearanceTransitionForViewState:superview:", self->_viewState, self->_view);
  }
  else
  {
    if (!viewState)
      return;
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
    objc_msgSend(WeakRetained, "runDisappearanceTransitionForViewState:", self->_viewState);
  }

}

- (void)_updateHost
{
  TUIHostingController **p_hostingController;
  id WeakRetained;
  TUIHostingViewState *viewState;
  TUIHostingViewState **p_viewState;
  id v7;
  id v8;
  TUIHostingViewState *obj;

  p_hostingController = &self->_hostingController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
  obj = (TUIHostingViewState *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewStateForIdentifier:", self->_identifier));

  p_viewState = &self->_viewState;
  viewState = self->_viewState;
  if (viewState != obj)
  {
    if (viewState)
    {
      v7 = objc_loadWeakRetained((id *)p_hostingController);
      objc_msgSend(v7, "runDisappearanceTransitionForViewState:", *p_viewState);

    }
    objc_storeStrong((id *)&self->_viewState, obj);
    if (*p_viewState && self->_visible)
    {
      v8 = objc_loadWeakRetained((id *)p_hostingController);
      objc_msgSend(v8, "runAppearanceTransitionForViewState:superview:", self->_viewState, self->_view);

    }
  }

}

- (TUIHostingController)hostingController
{
  return (TUIHostingController *)objc_loadWeakRetained((id *)&self->_hostingController);
}

- (TUIHostingIdentifier)identifier
{
  return self->_identifier;
}

- (UIView)view
{
  return self->_view;
}

- (TUIHostingViewState)viewState
{
  return self->_viewState;
}

- (TUICancellable)visibilityObserver
{
  return self->_visibilityObserver;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityObserver, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_hostingController);
}

@end
