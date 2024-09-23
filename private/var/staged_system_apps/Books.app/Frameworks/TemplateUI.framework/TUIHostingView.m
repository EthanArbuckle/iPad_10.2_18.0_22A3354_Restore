@implementation TUIHostingView

- (TUIHostingView)init
{
  TUIHostingView *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIHostingView;
  v2 = -[TUIHostingView init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection tui_allAPITraits](UITraitCollection, "tui_allAPITraits"));
    v4 = -[TUIHostingView registerForTraitChanges:withAction:](v2, "registerForTraitChanges:withAction:", v3, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v2;
}

+ (id)renderModelIdentifier:(id)a3 size:(CGSize)a4 requestedSize:(CGSize)a5 usingGeometry:(BOOL)a6 insets:(UIEdgeInsets)a7 hostingIdentifier:(id)a8 hostingProperties:(id)a9 anchorPoint:(CGPoint)a10
{
  double left;
  double top;
  _BOOL8 v13;
  double height;
  double width;
  double v16;
  double v17;
  id v19;
  id v20;
  id v21;
  _TUIlHostingRenderModel *v22;
  double bottom;
  double right;
  uint64_t v26;
  uint64_t v27;

  bottom = a7.bottom;
  right = a7.right;
  left = a7.left;
  top = a7.top;
  v13 = a6;
  height = a5.height;
  width = a5.width;
  v16 = a4.height;
  v17 = a4.width;
  v19 = a9;
  v20 = a8;
  v21 = a3;
  v22 = -[_TUIlHostingRenderModel initWithIdentifier:size:requestedSize:usingGeometry:insets:hostingIdentifier:hostingProperties:anchorPoint:]([_TUIlHostingRenderModel alloc], "initWithIdentifier:size:requestedSize:usingGeometry:insets:hostingIdentifier:hostingProperties:anchorPoint:", v21, v13, v20, v19, v17, v16, width, height, top, left, bottom, right, v26, v27);

  return v22;
}

- (void)setNeedsHostingUpdate
{
  id v3;
  NSObject *v4;

  if (!self->_flags.needsHostingUpdate)
  {
    v3 = TUIHostingLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_17E1BC(self);

    self->_flags.needsHostingUpdate = 1;
    -[TUIHostingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  TUIHostingIdentifier *v9;
  TUIHostingProperties *v10;
  TUIHostingIdentifier **p_hostingIdentifier;
  TUIHostingIdentifier *hostingIdentifier;
  TUIHostingProperties *hostingProperties;
  double v14;
  double v15;
  CGFloat v17;
  CGFloat v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  objc_super v25;

  v4 = a3;
  v5 = TUIHostingLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_17E30C(self, v6);

  v25.receiver = self;
  v25.super_class = (Class)TUIHostingView;
  -[TUIReusableBaseView applyLayoutAttributes:](&v25, "applyLayoutAttributes:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layoutAttributes](self, "layoutAttributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderModel"));

  v9 = (TUIHostingIdentifier *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hostingIdentifier"));
  v10 = (TUIHostingProperties *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hostingProperties"));
  p_hostingIdentifier = &self->_hostingIdentifier;
  hostingIdentifier = self->_hostingIdentifier;
  if ((hostingIdentifier == v9 || -[TUIHostingIdentifier isEqual:](hostingIdentifier, "isEqual:", v9))
    && ((hostingProperties = self->_hostingProperties, hostingProperties == v10)
     || -[TUIHostingProperties isEqual:](hostingProperties, "isEqual:", v10)))
  {
    objc_msgSend(v8, "requestedSize");
    if (self->_requestedSize.width != v15 || self->_requestedSize.height != v14)
    {
      objc_msgSend(v8, "requestedSize");
      self->_requestedSize.width = v17;
      self->_requestedSize.height = v18;
LABEL_20:
      -[TUIHostingView setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_21;
    }
    if (-[TUIHostingViewState needsLayout](self->_hostedViewState, "needsLayout"))
      goto LABEL_20;
  }
  else
  {
    v19 = TUIHostingLog();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      sub_17E268(self);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "hostingController"));

    if (*p_hostingIdentifier)
      objc_msgSend(v22, "removeProviderObserver:forIdentifier:", self);
    objc_storeStrong((id *)&self->_hostingIdentifier, v9);
    objc_storeStrong((id *)&self->_hostingProperties, v10);
    objc_msgSend(v8, "requestedSize");
    self->_requestedSize.width = v23;
    self->_requestedSize.height = v24;
    if (*p_hostingIdentifier)
      objc_msgSend(v22, "addProviderObserver:forIdentifier:", self);
    -[TUIHostingView setNeedsHostingUpdate](self, "setNeedsHostingUpdate");

  }
LABEL_21:

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostingController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingView traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v9, "needsGeometryUpdateWithOldTraitCollection:newTraitCollection:", v7, v5);

  if (v8)
    -[TUIHostingView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 needsHostingUpdate;
  TUIHostingViewState *v8;
  id v9;
  NSObject *v10;
  TUIHostingViewState **p_hostedViewState;
  TUIHostingViewState *v12;
  TUICancellable *hostedViewVisibilityCancellable;
  int v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  TUIHostingIdentifier *v28;
  void *v29;
  void *v30;
  void *v31;
  TUIHostingIdentifier *v32;
  TUICancellable *v33;
  TUICancellable *v34;
  void *v35;
  id v36;
  TUIHostingIdentifier *hostingIdentifier;
  TUIHostingViewState *hostedViewState;
  _QWORD v39[4];
  id v40;
  TUIHostingIdentifier *v41;
  objc_super v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  TUIHostingIdentifier *v46;
  __int16 v47;
  TUIHostingView *v48;
  __int16 v49;
  TUIHostingViewState *v50;
  __int16 v51;
  TUIHostingViewState *v52;

  v3 = TUIHostingLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_17E410((uint64_t)self, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingController"));

  needsHostingUpdate = self->_flags.needsHostingUpdate;
  if (self->_flags.needsHostingUpdate)
  {
    self->_flags.needsHostingUpdate = 0;
    v8 = (TUIHostingViewState *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewStateForIdentifier:", self->_hostingIdentifier));
    v9 = TUIHostingLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
      v36 = objc_msgSend(v35, "feedId");
      hostingIdentifier = self->_hostingIdentifier;
      hostedViewState = self->_hostedViewState;
      *(_DWORD *)buf = 134219010;
      v44 = v36;
      v45 = 2112;
      v46 = hostingIdentifier;
      v47 = 2048;
      v48 = self;
      v49 = 2114;
      v50 = hostedViewState;
      v51 = 2114;
      v52 = v8;
      _os_log_debug_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "[fid:%lu] hosting update for identifier=%@ view=%p %{public}@ -> %{public}@", buf, 0x34u);

    }
    p_hostedViewState = &self->_hostedViewState;
    v12 = self->_hostedViewState;
    if (v12 == v8)
      goto LABEL_11;
    if (v12)
      objc_msgSend(v6, "runDisappearanceTransitionForViewState:");
    objc_storeStrong((id *)p_hostedViewState, v8);
    hostedViewVisibilityCancellable = self->_hostedViewVisibilityCancellable;
    self->_hostedViewVisibilityCancellable = 0;

    if (!*p_hostedViewState)
    {
LABEL_11:
      v14 = 0;
    }
    else
    {
      objc_msgSend(v6, "runAppearanceTransitionForViewState:superview:", *p_hostedViewState, self);
      v14 = 1;
    }

  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layoutAttributes](self, "layoutAttributes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "renderModel"));

  objc_msgSend(v16, "insets");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = objc_msgSend(v16, "usingGeometry");
  objc_msgSend(v16, "anchorPoint");
  -[TUIHostingViewState setAnchorPoint:](self->_hostedViewState, "setAnchorPoint:");
  if (self->_hostedViewState)
  {
    if (needsHostingUpdate)
      v26 = 1;
    else
      v26 = v25 ^ 1;
    objc_msgSend(v6, "updateFrameIfNeeded:forViewState:requestedSize:insets:", v26, self->_requestedSize.width, self->_requestedSize.height, v18, v20, v22, v24);
  }
  if (objc_msgSend(v16, "usingGeometry") && self->_hostedViewState)
    objc_msgSend(v6, "runAppearanceAnimationIfNeededForViewState:");
  v42.receiver = self;
  v42.super_class = (Class)TUIHostingView;
  -[TUIHostingView layoutSubviews](&v42, "layoutSubviews");
  if (self->_hostedViewState)
    objc_msgSend(v6, "updateGeometryForViewState:requestedSize:insets:", self->_requestedSize.width, self->_requestedSize.height, v18, v20, v22, v24);
  if (v14)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingViewState visibilityOptions](self->_hostedViewState, "visibilityOptions"));
    if (v27)
    {
      v28 = self->_hostingIdentifier;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "viewVisibilityController"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingViewState view](self->_hostedViewState, "view"));
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_B1A08;
      v39[3] = &unk_240A00;
      v40 = v6;
      v41 = v28;
      v32 = v28;
      v33 = (TUICancellable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "observeView:options:block:", v31, v27, v39));
      v34 = self->_hostedViewVisibilityCancellable;
      self->_hostedViewVisibilityCancellable = v33;

    }
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIHostingView;
  -[TUIReusableBaseView prepareForReuse](&v3, "prepareForReuse");
  -[TUIHostingView _cleanup](self, "_cleanup");
}

- (void)viewDidEndDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIHostingView;
  -[TUIReusableBaseView viewDidEndDisplay](&v3, "viewDidEndDisplay");
  -[TUIHostingView _cleanup](self, "_cleanup");
}

- (void)_cleanup
{
  void *v3;
  void *v4;
  TUIHostingIdentifier **p_hostingIdentifier;
  TUIHostingIdentifier *hostingIdentifier;
  TUIHostingIdentifier *v7;
  TUIHostingProperties *hostingProperties;
  TUICancellable *hostedViewVisibilityCancellable;
  TUIHostingViewState *hostedViewState;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hostingController"));

  p_hostingIdentifier = &self->_hostingIdentifier;
  hostingIdentifier = self->_hostingIdentifier;
  if (v4)
  {
    if (hostingIdentifier)
    {
      objc_msgSend(v4, "removeProviderObserver:forIdentifier:", self);
      v7 = *p_hostingIdentifier;
      *p_hostingIdentifier = 0;

      hostingProperties = self->_hostingProperties;
      self->_hostingProperties = 0;

    }
    if (self->_hostedViewState)
    {
      hostedViewVisibilityCancellable = self->_hostedViewVisibilityCancellable;
      self->_hostedViewVisibilityCancellable = 0;

      objc_msgSend(v4, "didEndDisplayForViewState:", self->_hostedViewState);
      hostedViewState = self->_hostedViewState;
      self->_hostedViewState = 0;

    }
  }
  else if (hostingIdentifier || self->_hostedViewState)
  {
    v11 = TUIHostingLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_17E49C((uint64_t *)&self->_hostingIdentifier, (uint64_t)self, v12);

    if (_TUIDeviceHasInternalInstall())
    {
      v13 = objc_alloc((Class)NSException);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The hosting view has no hosting controller and is not cleaned up: identifier %@, viewState %@"), *p_hostingIdentifier, self->_hostedViewState));
      v15 = objc_msgSend(v13, "initWithName:reason:userInfo:", CFSTR("HostingViewDetachedFromHost"), v14, 0);

      objc_exception_throw(v15);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedViewVisibilityCancellable, 0);
  objc_storeStrong((id *)&self->_hostedViewState, 0);
  objc_storeStrong((id *)&self->_hostingProperties, 0);
  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
}

@end
