@implementation LookAroundChromeOverlay

- (void)setHost:(id)a3
{
  id WeakRetained;
  void *v5;
  LookAroundButtonContainerViewController *lookAroundController;
  void *v7;
  void *v8;
  LookAroundButtonContainerViewController *v9;
  LookAroundButtonContainerViewController *v10;
  void *v11;
  void *v12;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  v5 = obj;
  if (WeakRetained != obj)
  {
    lookAroundController = self->_lookAroundController;
    if (lookAroundController)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController parentViewController](lookAroundController, "parentViewController"));

      if (v7)
      {
        -[LookAroundButtonContainerViewController willMoveToParentViewController:](self->_lookAroundController, "willMoveToParentViewController:", 0);
        if (-[LookAroundButtonContainerViewController isViewLoaded](self->_lookAroundController, "isViewLoaded"))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundButtonContainerViewController view](self->_lookAroundController, "view"));
          objc_msgSend(v8, "removeFromSuperview");

        }
        -[LookAroundButtonContainerViewController removeFromParentViewController](self->_lookAroundController, "removeFromParentViewController");
        -[LookAroundChromeOverlay _invalidateConstraints](self, "_invalidateConstraints");
      }
    }
    objc_storeWeak((id *)&self->_host, obj);
    v5 = obj;
    if (obj)
    {
      if (!self->_lookAroundController)
      {
        v9 = objc_alloc_init(LookAroundButtonContainerViewController);
        v10 = self->_lookAroundController;
        self->_lookAroundController = v9;

        -[LookAroundButtonContainerViewController setDelegate:](self->_lookAroundController, "setDelegate:", self);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "containingViewController"));
      -[LookAroundButtonContainerViewController willMoveToParentViewController:](self->_lookAroundController, "willMoveToParentViewController:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "overlayContentView"));
      -[LookAroundChromeOverlay _installInContentView:](self, "_installInContentView:", v12);

      -[LookAroundButtonContainerViewController didMoveToParentViewController:](self->_lookAroundController, "didMoveToParentViewController:", v11);
      v5 = obj;
    }
  }

}

- (void)_installInContentView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundChromeOverlay view](self, "view"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

  if (v5 != v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundChromeOverlay view](self, "view"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundChromeOverlay view](self, "view"));
    objc_msgSend(v8, "addSubview:", v7);

    -[LookAroundChromeOverlay _updateLayout](self, "_updateLayout");
  }

}

- (void)_invalidateConstraints
{
  NSArray *constraints;

  if (self->_constraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    constraints = self->_constraints;
    self->_constraints = 0;

  }
}

- (void)_updateConstraintsIfNeeded
{
  id WeakRetained;
  void *v4;
  _BOOL4 hasLeadingEdgeLayout;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  NSArray *v16;
  NSArray *constraints;
  _QWORD v18[2];
  _QWORD v19[2];

  if (!self->_constraints)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layoutGuideForOverlay:", self));

    if (v4)
    {
      hasLeadingEdgeLayout = self->_hasLeadingEdgeLayout;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundChromeOverlay view](self, "view"));
      v7 = v6;
      if (hasLeadingEdgeLayout)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
        v19[0] = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundChromeOverlay view](self, "view"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
        v19[1] = v14;
        v15 = v19;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
        v18[0] = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundChromeOverlay view](self, "view"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
        v18[1] = v14;
        v15 = v18;
      }
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
      constraints = self->_constraints;
      self->_constraints = v16;

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
    }

  }
}

- (void)_updateLayout
{
  void *v3;
  _BOOL4 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom") != (id)5;

  if (self->_hasLeadingEdgeLayout != v4)
  {
    self->_hasLeadingEdgeLayout = v4;
    -[LookAroundChromeOverlay _invalidateConstraints](self, "_invalidateConstraints");
  }
  -[LookAroundChromeOverlay _updateConstraintsIfNeeded](self, "_updateConstraintsIfNeeded");
}

- (void)setContainerStyle:(unint64_t)a3
{
  if (self->_containerStyle != a3)
  {
    self->_containerStyle = a3;
    -[LookAroundButtonContainerViewController setContainerStyle:](self->_lookAroundController, "setContainerStyle:");
    -[LookAroundChromeOverlay _updateLayout](self, "_updateLayout");
  }
}

- (id)view
{
  return -[LookAroundButtonContainerViewController view](self->_lookAroundController, "view");
}

- (BOOL)isHidden
{
  return self->_overlayHidden;
}

- (void)setHidden:(BOOL)a3
{
  -[LookAroundChromeOverlay setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  GroupAnimation *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  BOOL v18;

  if (self->_overlayHidden != a3)
  {
    v4 = a4;
    self->_overlayHidden = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundChromeOverlay view](self, "view"));
    v8 = objc_alloc_init(GroupAnimation);
    -[GroupAnimation setAnimated:](v8, "setAnimated:", v4);
    -[GroupAnimation setDuration:](v8, "setDuration:", 0.3);
    -[GroupAnimation setOptions:](v8, "setOptions:", 4);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100215CA8;
    v16[3] = &unk_1011AC838;
    v16[4] = self;
    v18 = a3;
    v9 = v7;
    v17 = v9;
    -[GroupAnimation addPreparation:](v8, "addPreparation:", v16);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100215CD0;
    v15[3] = &unk_1011AC860;
    v15[4] = self;
    -[GroupAnimation addAnimations:](v8, "addAnimations:", v15);
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100215CD8;
    v11[3] = &unk_1011AC888;
    objc_copyWeak(&v13, &location);
    v10 = v9;
    v12 = v10;
    -[GroupAnimation addCompletion:](v8, "addCompletion:", v11);
    -[GroupAnimation runWithCurrentOptions](v8, "runWithCurrentOptions");

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

- (void)_updateAlpha
{
  double overlayAlpha;
  id v3;

  overlayAlpha = 0.0;
  if (!self->_overlayHidden)
    overlayAlpha = self->_overlayAlpha;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundChromeOverlay view](self, "view"));
  objc_msgSend(v3, "setAlpha:", overlayAlpha);

}

- (double)alpha
{
  return self->_overlayAlpha;
}

- (void)setAlpha:(double)a3
{
  if (self->_overlayAlpha != a3)
  {
    self->_overlayAlpha = a3;
    -[LookAroundChromeOverlay _updateAlpha](self, "_updateAlpha");
  }
}

- (void)showLookAroundPreviewForMapItem:(id)a3 willChangeHidden:(BOOL)a4 animated:(BOOL)a5
{
  -[LookAroundButtonContainerViewController setMapItem:willChangeHidden:animated:](self->_lookAroundController, "setMapItem:willChangeHidden:animated:", a3, a4, a5);
}

- (void)enterLookAroundForMapItem:(id)a3 lookAroundView:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;

  v6 = a4;
  v7 = a3;
  +[GEOAPPortal captureLookAroundUserAction:onTarget:eventValue:](GEOAPPortal, "captureLookAroundUserAction:onTarget:eventValue:", 6060, 201, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "enterLookAroundForMapItem:lookAroundView:", v7, v6);

}

- (void)enterLookAroundPIP:(id)a3
{
  LookAroundChromeOverlayDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "enterLookAroundPIP:", v4);

}

- (ChromeOverlayHosting)host
{
  return (ChromeOverlayHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (LookAroundChromeOverlayDelegate)delegate
{
  return (LookAroundChromeOverlayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)containerStyle
{
  return self->_containerStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_lookAroundController, 0);
}

@end
