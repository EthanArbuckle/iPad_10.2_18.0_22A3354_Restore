@implementation _UIContainerWindowPortalInteraction

- (void)ensureVisibilityInContainerWindow
{
  UIView **p_view;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  _UIContainerWindowPortalView *v11;
  _UIContainerWindowPortalView *portalView;
  id v13;

  if (self->_portalViewEnabled)
  {
    p_view = &self->_view;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v5 = objc_msgSend(WeakRetained, "isHidden");

    if ((v5 & 1) == 0)
    {
      if (self->_attemptsToUseAncestorViewContainer
        || (v6 = objc_loadWeakRetained((id *)p_view),
            objc_msgSend(v6, "window"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "_isRemoteKeyboardWindow"),
            v7,
            v6,
            v8))
      {
        -[_UIContainerWindowPortalInteraction _visibleViewContainer](self, "_visibleViewContainer");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[_UIContainerWindowPortalInteraction containerWindow](self, "containerWindow");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v13 = (id)v9;
      -[UIView superview](self->_portalView, "superview");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v13 != v10)
      {
        -[UIView removeFromSuperview](self->_portalView, "removeFromSuperview");
        -[_UIContainerWindowPortalInteraction _makePortalView](self, "_makePortalView");
        v11 = (_UIContainerWindowPortalView *)objc_claimAutoreleasedReturnValue();
        portalView = self->_portalView;
        self->_portalView = v11;

        objc_msgSend(v13, "addSubview:", self->_portalView);
      }

    }
  }
}

- (void)willMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  id WeakRetained;

  p_view = &self->_view;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);

  if (WeakRetained != v5)
    -[_UIContainerWindowPortalInteraction _setPortalViewEnabled:](self, "_setPortalViewEnabled:", 0);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  self->_enabled = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained)
    -[_UIContainerWindowPortalInteraction _setPortalViewEnabled:](self, "_setPortalViewEnabled:", v3);
}

- (void)didMoveToView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    -[_UIContainerWindowPortalInteraction _setPortalViewEnabled:](self, "_setPortalViewEnabled:", 0);
    objc_storeWeak((id *)&self->_view, obj);
    v5 = obj;
    if (obj)
    {
      -[_UIContainerWindowPortalInteraction _setPortalViewEnabled:](self, "_setPortalViewEnabled:", -[_UIContainerWindowPortalInteraction isEnabled](self, "isEnabled"));
      v5 = obj;
    }
  }

}

- (void)_setPortalViewEnabled:(BOOL)a3
{
  id WeakRetained;
  char v5;
  _UIContainerWindowPortalView *v6;
  _UIContainerWindowPortalView *v7;
  _UIContainerWindowPortalView *portalView;

  if (self->_portalViewEnabled != a3)
  {
    self->_portalViewEnabled = a3;
    if (a3
      && (WeakRetained = objc_loadWeakRetained((id *)&self->_view),
          v5 = objc_msgSend(WeakRetained, "isHidden"),
          WeakRetained,
          (v5 & 1) == 0))
    {
      -[UIView removeFromSuperview](self->_portalView, "removeFromSuperview");
      -[_UIContainerWindowPortalInteraction _makePortalView](self, "_makePortalView");
      v7 = (_UIContainerWindowPortalView *)objc_claimAutoreleasedReturnValue();
      portalView = self->_portalView;
      self->_portalView = v7;

      -[_UIContainerWindowPortalInteraction ensureVisibilityInContainerWindow](self, "ensureVisibilityInContainerWindow");
    }
    else
    {
      -[UIView removeFromSuperview](self->_portalView, "removeFromSuperview");
      v6 = self->_portalView;
      self->_portalView = 0;

    }
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setAttemptsToUseAncestorViewContainer:(BOOL)a3
{
  self->_attemptsToUseAncestorViewContainer = a3;
}

- (UIWindow)containerWindow
{
  UIView **p_view;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (!WeakRetained
    || (v4 = objc_loadWeakRetained((id *)p_view),
        objc_msgSend(v4, "keyboardSceneDelegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "containerWindow"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v6))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIWindow *)v6;
}

- (CGRect)_unionFrameForView:(id)a3
{
  id v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "bounds");
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v3, "subviews", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16), "frame");
        v34.origin.x = v17;
        v34.origin.y = v18;
        v34.size.width = v19;
        v34.size.height = v20;
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        v32 = CGRectUnion(v31, v34);
        x = v32.origin.x;
        y = v32.origin.y;
        width = v32.size.width;
        height = v32.size.height;
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)_viewIsVisibleInContainer:(id)a3
{
  UIView **p_view;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGRect v33;
  CGRect v34;

  if (!a3)
    return 0;
  p_view = &self->_view;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  -[_UIContainerWindowPortalInteraction _unionFrameForView:](self, "_unionFrameForView:", WeakRetained);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v5, "convertRect:fromView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v5, "visibleBounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v33.origin.x = v25;
  v33.origin.y = v27;
  v33.size.width = v29;
  v33.size.height = v31;
  v34.origin.x = v17;
  v34.origin.y = v19;
  v34.size.width = v21;
  v34.size.height = v23;
  return CGRectContainsRect(v33, v34);
}

- (id)_visibleViewContainer
{
  UIView **p_view;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  CGRect v38;
  CGRect v39;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    do
    {
      if (-[_UIContainerWindowPortalInteraction _viewIsVisibleInContainer:](self, "_viewIsVisibleInContainer:", v5))
        break;
      objc_msgSend(v5, "superview");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  objc_msgSend(v5, "safeAreaInsets");
  if (v7 > 0.0)
  {
    objc_msgSend(v5, "_viewControllerForAncestor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "navigationBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_loadWeakRetained((id *)p_view);
      -[_UIContainerWindowPortalInteraction _unionFrameForView:](self, "_unionFrameForView:", v12);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      v21 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v11, "convertRect:fromView:", v21, v14, v16, v18, v20);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;

      objc_msgSend(v11, "bounds");
      v39.origin.x = v23;
      v39.origin.y = v25;
      v39.size.width = v27;
      v39.size.height = v29;
      if (CGRectIntersectsRect(v38, v39))
      {
        objc_msgSend(v11, "superview");
        v30 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v30;
      }

    }
  }
  -[UIView __viewDelegate]((id *)v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_opt_respondsToSelector();

  if ((v32 & 1) != 0)
  {
    -[UIView __viewDelegate]((id *)v5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_containerForContainerWindowPortalInteraction");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = v34;

      v5 = v35;
    }

  }
  if (!v5)
  {
    -[_UIContainerWindowPortalInteraction containerWindow](self, "containerWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v36 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v36, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v5;
}

- (id)_makePortalView
{
  _UIContainerWindowPortalView *v3;
  UIView **p_view;
  id WeakRetained;
  _UIContainerWindowPortalView *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;

  v3 = [_UIContainerWindowPortalView alloc];
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v6 = -[_UIPortalView initWithSourceView:](v3, "initWithSourceView:", WeakRetained);

  -[_UIPortalView setForwardsClientHitTestingToSourceView:](v6, "setForwardsClientHitTestingToSourceView:", 1);
  -[_UIPortalView _setGeometryFrozen:](v6, "_setGeometryFrozen:", 1);
  -[_UIPortalView setHidesSourceView:](v6, "setHidesSourceView:", 1);
  -[_UIPortalView setMatchesPosition:](v6, "setMatchesPosition:", 1);
  -[_UIPortalView setMatchesTransform:](v6, "setMatchesTransform:", 1);
  -[_UIPortalView setMatchesAlpha:](v6, "setMatchesAlpha:", 1);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_loadWeakRetained((id *)p_view);
  v9 = objc_opt_class();
  v10 = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v7, "stringWithFormat:", CFSTR("source: <%@: %p>"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIPortalView setName:](v6, "setName:", v11);
  return v6;
}

- (void)_viewVisibilityDidChange
{
  id WeakRetained;
  uint64_t v4;

  if (-[_UIContainerWindowPortalInteraction isEnabled](self, "isEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v4 = objc_msgSend(WeakRetained, "isHidden") ^ 1;

  }
  else
  {
    v4 = 0;
  }
  -[_UIContainerWindowPortalInteraction _setPortalViewEnabled:](self, "_setPortalViewEnabled:", v4);
}

- (BOOL)_portalViewEnabled
{
  return self->_portalViewEnabled;
}

- (BOOL)attemptsToUseAncestorViewContainer
{
  return self->_attemptsToUseAncestorViewContainer;
}

- (_UIContainerWindowPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_portalView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
