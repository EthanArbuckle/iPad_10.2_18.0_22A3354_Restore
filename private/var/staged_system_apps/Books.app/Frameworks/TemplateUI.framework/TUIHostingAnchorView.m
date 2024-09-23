@implementation TUIHostingAnchorView

+ (id)renderModelIdentifier:(id)a3 submodel:(id)a4 hostingIdentifier:(id)a5 hostingProperties:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _TUIHostingAnchorRenderModel *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[_TUIHostingAnchorRenderModel initWithIdentifier:submodel:hostingIdentifier:hostingProperties:]([_TUIHostingAnchorRenderModel alloc], "initWithIdentifier:submodel:hostingIdentifier:hostingProperties:", v12, v11, v10, v9);

  return v13;
}

- (void)setNeedsHostingUpdate
{
  if (!self->_flags.needsHostingUpdate)
  {
    self->_flags.needsHostingUpdate = 1;
    -[TUIHostingAnchorView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  void *v4;
  void *v5;
  TUIHostingIdentifier *v6;
  TUIHostingProperties *v7;
  TUIHostingIdentifier **p_hostingIdentifier;
  TUIHostingIdentifier *hostingIdentifier;
  TUIHostingProperties *hostingProperties;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TUIHostingAnchorView;
  -[TUIContainerView applyLayoutAttributes:](&v13, "applyLayoutAttributes:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layoutAttributes](self, "layoutAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel"));

  v6 = (TUIHostingIdentifier *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingIdentifier"));
  v7 = (TUIHostingProperties *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingProperties"));
  p_hostingIdentifier = &self->_hostingIdentifier;
  hostingIdentifier = self->_hostingIdentifier;
  if (hostingIdentifier != v6 && !-[TUIHostingIdentifier isEqual:](hostingIdentifier, "isEqual:", v6)
    || (hostingProperties = self->_hostingProperties, hostingProperties != v7)
    && !-[TUIHostingProperties isEqual:](hostingProperties, "isEqual:", v7))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hostingController"));

    if (*p_hostingIdentifier)
      objc_msgSend(v12, "removeProviderObserver:forIdentifier:", self);
    objc_storeStrong((id *)&self->_hostingIdentifier, v6);
    objc_storeStrong((id *)&self->_hostingProperties, v7);
    if (*p_hostingIdentifier)
      objc_msgSend(v12, "addProviderObserver:forIdentifier:", self);
    -[TUIHostingAnchorView setNeedsHostingUpdate](self, "setNeedsHostingUpdate");

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TUICancellable *v8;
  TUICancellable *visibilityCancellable;
  TUIHostingViewState *v10;
  TUIHostingViewState *hostedViewState;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hostingController"));

  if (!self->_visibilityCancellable)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUIVisibilityOptions modalAnchorOptions](TUIVisibilityOptions, "modalAnchorOptions"));
    objc_initWeak(&location, self);
    self->_flags.visible = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewVisibilityController"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_7CE00;
    v13[3] = &unk_23FF90;
    objc_copyWeak(&v14, &location);
    v8 = (TUICancellable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "observeView:options:block:", self, v5, v13));
    visibilityCancellable = self->_visibilityCancellable;
    self->_visibilityCancellable = v8;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  if (self->_flags.needsHostingUpdate)
  {
    self->_flags.needsHostingUpdate = 0;
    v10 = (TUIHostingViewState *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewStateForIdentifier:", self->_hostingIdentifier));
    hostedViewState = self->_hostedViewState;
    if (hostedViewState != v10)
    {
      if (hostedViewState)
        objc_msgSend(v4, "runDisappearanceTransitionForViewState:");
      objc_storeStrong((id *)&self->_hostedViewState, v10);
      if (self->_hostedViewState && self->_flags.visible)
        objc_msgSend(v4, "runAppearanceTransitionForViewState:superview:");
    }

  }
  v12.receiver = self;
  v12.super_class = (Class)TUIHostingAnchorView;
  -[TUIContainerView layoutSubviews](&v12, "layoutSubviews");

}

- (void)_updateVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  TUIHostingViewState *hostedViewState;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingController"));

  self->_flags.visible = v3;
  hostedViewState = self->_hostedViewState;
  if (v3)
    objc_msgSend(v7, "runAppearanceTransitionForViewState:superview:", hostedViewState, self);
  else
    objc_msgSend(v7, "runDisappearanceTransitionForViewState:", hostedViewState);

}

- (void)viewDidEndDisplay
{
  void *v3;
  void *v4;
  TUICancellable *visibilityCancellable;
  TUIHostingViewState *hostedViewState;
  TUIHostingIdentifier *hostingIdentifier;
  TUIHostingProperties *hostingProperties;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIHostingAnchorView;
  -[TUIContainerView viewDidEndDisplay](&v9, "viewDidEndDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hostingController"));

  visibilityCancellable = self->_visibilityCancellable;
  self->_visibilityCancellable = 0;

  self->_flags.visible = 0;
  if (self->_hostedViewState)
  {
    objc_msgSend(v4, "didEndDisplayForViewState:");
    hostedViewState = self->_hostedViewState;
    self->_hostedViewState = 0;

    hostingIdentifier = self->_hostingIdentifier;
    self->_hostingIdentifier = 0;

    hostingProperties = self->_hostingProperties;
    self->_hostingProperties = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityCancellable, 0);
  objc_storeStrong((id *)&self->_hostedViewState, 0);
  objc_storeStrong((id *)&self->_hostingProperties, 0);
  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
}

@end
