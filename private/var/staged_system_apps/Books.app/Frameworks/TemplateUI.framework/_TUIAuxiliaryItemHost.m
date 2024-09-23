@implementation _TUIAuxiliaryItemHost

- (_TUIAuxiliaryItemHost)initWithIdentifier:(id)a3 hostingController:(id)a4 item:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TUIAuxiliaryItemHost *v12;
  _TUIAuxiliaryItemHost *v13;
  id WeakRetained;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_TUIAuxiliaryItemHost;
  v12 = -[_TUIAuxiliaryItemHost init](&v16, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeWeak((id *)&v13->_hostingController, v10);
    objc_storeStrong((id *)&v13->_item, a5);
    WeakRetained = objc_loadWeakRetained((id *)&v13->_hostingController);
    objc_msgSend(WeakRetained, "addProviderObserver:forIdentifier:", v13, v13->_identifier);

  }
  return v13;
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
  v5.super_class = (Class)_TUIAuxiliaryItemHost;
  -[_TUIAuxiliaryItemHost dealloc](&v5, "dealloc");
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
    if (*p_viewState)
    {
      v8 = objc_loadWeakRetained((id *)p_hostingController);
      objc_msgSend(v8, "runAppearanceTransitionForViewState:barButtonItem:", self->_viewState, self->_item);

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

- (UIBarButtonItem)item
{
  return self->_item;
}

- (TUIHostingViewState)viewState
{
  return self->_viewState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_hostingController);
}

@end
