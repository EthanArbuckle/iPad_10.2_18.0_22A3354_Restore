@implementation TUIHoverVisibleView

+ (id)renderModelWithSubviewsModel:(id)a3 identifier:(id)a4 hoverIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TUIHoverVisibleRenderModel *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_TUIHoverVisibleRenderModel initWithIdentifier:submodel:hoverIdentifier:]([_TUIHoverVisibleRenderModel alloc], "initWithIdentifier:submodel:hoverIdentifier:", v8, v9, v7);

  return v10;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIHoverVisibleView;
  v4 = a3;
  -[TUIContainerView applyLayoutAttributes:](&v6, "applyLayoutAttributes:", v4);
  v5 = objc_msgSend(v4, "forceVisibleOnHover", v6.receiver, v6.super_class);

  self->_forceVisible = v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIHoverVisibleView;
  -[TUIContainerView prepareForReuse](&v3, "prepareForReuse");
  self->_forceVisible = 0;
}

- (BOOL)showContents
{
  return self->_visible || self->_forceVisible;
}

- (BOOL)_updateVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  int visible;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layoutAttributes](self, "layoutAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "renderModel"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHoverVisibleView hoverController](self, "hoverController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hoverIdentifier"));
  v7 = objc_msgSend(v5, "hoverStateForIdentifier:", v6);

  visible = self->_visible;
  if (visible != v7)
    self->_visible = v7;
  v9 = visible != v7;

  return v9;
}

- (id)hoverController
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHoverVisibleView superview](self, "superview"));
  if (v2)
  {
    do
    {
      if ((objc_opt_respondsToSelector(v2, "hoverController") & 1) != 0)
        break;
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "superview"));

      v2 = (void *)v3;
    }
    while (v3);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hoverController"));

  return v4;
}

- (void)viewWillDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIHoverVisibleView;
  -[TUIReusableBaseView viewWillDisplay](&v4, "viewWillDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHoverVisibleView hoverController](self, "hoverController"));
  objc_msgSend(v3, "registerHoverObserver:", self);

  -[TUIHoverVisibleView _updateVisible](self, "_updateVisible");
}

- (void)viewDidEndDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIHoverVisibleView;
  -[TUIContainerView viewDidEndDisplay](&v4, "viewDidEndDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHoverVisibleView hoverController](self, "hoverController"));
  objc_msgSend(v3, "unregisterHoverObserver:", self);

}

- (void)hoverStateChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layoutAttributes](self, "layoutAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel"));

  if (!v8
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hoverIdentifier")),
        v7 = objc_msgSend(v8, "containsObject:", v6),
        v6,
        v7))
  {
    if (-[TUIHoverVisibleView _updateVisible](self, "_updateVisible"))
      -[TUIContainerView invalidateShowContents](self, "invalidateShowContents");
  }

}

@end
