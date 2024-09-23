@implementation FloatingControlsOverlay

- (void)setHost:(id)a3
{
  id WeakRetained;
  void *v5;
  FloatingControlsViewController *floatingControlsViewController;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  FloatingControlsViewController *v12;
  FloatingControlsViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  v5 = obj;
  if (WeakRetained != obj)
  {
    floatingControlsViewController = self->_floatingControlsViewController;
    if (floatingControlsViewController)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController parentViewController](floatingControlsViewController, "parentViewController"));

      if (v7)
      {
        -[FloatingControlsViewController willMoveToParentViewController:](self->_floatingControlsViewController, "willMoveToParentViewController:", 0);
        if (-[FloatingControlsViewController isViewLoaded](self->_floatingControlsViewController, "isViewLoaded"))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsViewController view](self->_floatingControlsViewController, "view"));
          objc_msgSend(v8, "removeFromSuperview");

        }
        -[FloatingControlsViewController removeFromParentViewController](self->_floatingControlsViewController, "removeFromParentViewController");
      }
    }
    objc_storeWeak((id *)&self->_host, obj);
    v5 = obj;
    if (obj)
    {
      if (!self->_floatingControlsViewController)
      {
        v9 = (objc_class *)objc_opt_class(IOSFloatingControlsViewController);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "overlayContentView"));
        v11 = sub_1002A8AA0(v10);

        if (v11 == 5)
          v9 = (objc_class *)objc_opt_class(MacFloatingControlsViewController);
        v12 = (FloatingControlsViewController *)objc_alloc_init(v9);
        v13 = self->_floatingControlsViewController;
        self->_floatingControlsViewController = v12;

        -[FloatingControlsViewController setActionCoordinator:](self->_floatingControlsViewController, "setActionCoordinator:", self);
        -[FloatingControlsOverlay margin](self, "margin");
        -[FloatingControlsViewController setMargin:](self->_floatingControlsViewController, "setMargin:");
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay mapViewProvider](self, "mapViewProvider"));
        -[FloatingControlsViewController setMapViewProviding:](self->_floatingControlsViewController, "setMapViewProviding:", v14);

        if (v11 == 5)
          -[FloatingControlsViewController showControlsIfNeeded:animated:](self->_floatingControlsViewController, "showControlsIfNeeded:animated:", 76, 0);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "containingViewController"));
      -[FloatingControlsViewController willMoveToParentViewController:](self->_floatingControlsViewController, "willMoveToParentViewController:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "overlayContentView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "layoutGuideForOverlay:", self));
      -[FloatingControlsOverlay _installInContentView:layoutGuide:](self, "_installInContentView:layoutGuide:", v16, v17);

      -[FloatingControlsOverlay _setupViewportConstraintsInHost:](self, "_setupViewportConstraintsInHost:", obj);
      -[PassThroughViewController didMoveToParentViewController:](self->_floatingControlsViewController, "didMoveToParentViewController:", v15);

      v5 = obj;
    }
  }

}

- (id)view
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return v3;
}

- (void)setAlpha:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  objc_msgSend(v4, "setAlpha:", a3);

}

- (double)alpha
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  objc_msgSend(v3, "alpha");
  v5 = v4;

  return v5;
}

- (void)setBlurGroupName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  objc_msgSend(v5, "setBlurGroupName:", v4);

}

- (NSString)blurGroupName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "blurGroupName"));

  return (NSString *)v3;
}

- (void)_installInContentView:(id)a3 layoutGuide:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  MapsEdgeConstraints *v25;
  MapsEdgeConstraints *edgeConstraints;
  void *v27;
  id v28;

  v28 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay view](self, "view"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));

  if (v8 != v28)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
    v10 = objc_msgSend(v9, "isViewLoaded");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay view](self, "view"));
      objc_msgSend(v11, "removeFromSuperview");

    }
    if (v28)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay view](self, "view"));
      objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      objc_msgSend(v28, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay view](self, "view"));
      objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay view](self, "view"));
      objc_msgSend(v28, "addSubview:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay view](self, "view"));
      LODWORD(v24) = 1148846080;
      v25 = (MapsEdgeConstraints *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v6, v24));
      edgeConstraints = self->_edgeConstraints;
      self->_edgeConstraints = v25;

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints allConstraints](self->_edgeConstraints, "allConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

    }
  }

}

- (void)_setupViewportConstraintsInHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewportLayoutGuide"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
    v7 = objc_msgSend(v6, "isViewLoaded");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "overlayContentView"));
      v9 = sub_1002A8AA0(v8);

      if (v9 != 5)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "buttonsContainerViewController"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:", v14));
        v17 = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
        objc_msgSend(v4, "setViewportConstraints:forOverlay:", v16, self);

        objc_msgSend(v4, "setViewportConstraintsEnabled:forOverlay:", 1, self);
      }
    }
  }

}

- (BOOL)isHidden
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  v3 = objc_msgSend(v2, "visible") ^ 1;

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  -[FloatingControlsOverlay setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  objc_msgSend(v6, "setVisible:animated:", !v5, v4);

}

- (void)setMargin:(double)a3
{
  id v4;

  self->_margin = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  objc_msgSend(v4, "setMargin:", a3);

}

- (void)setMapViewProvider:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  void *v8;
  id obj;

  v4 = a3;
  v5 = (unint64_t)objc_loadWeakRetained((id *)&self->_mapViewProvider);
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    obj = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)obj;
    if ((v7 & 1) == 0)
    {
      objc_storeWeak((id *)&self->_mapViewProvider, obj);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
      objc_msgSend(v8, "setMapViewProviding:", obj);

      v6 = (unint64_t)obj;
    }
  }

}

- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  if ((a3 & 0x40) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay venuesManager](self, "venuesManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
    objc_msgSend(v7, "addChangeObserver:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay venuesManager](self, "venuesManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "venueWithFocus"));
    objc_msgSend(v9, "didChangeFocusedVenue:", v11);

  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  objc_msgSend(v12, "showControlsIfNeeded:animated:", a3, v4);

}

- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  if ((a3 & 0x40) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay venuesManager](self, "venuesManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
    objc_msgSend(v7, "removeChangeObserver:", v8);

  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  objc_msgSend(v9, "hideControlsIfNeeded:animated:", a3, v4);

}

- (void)refreshControls
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  objc_msgSend(v2, "refreshControls");

}

- (void)setSearchSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  objc_msgSend(v5, "setSearchSession:", v4);

}

- (int64_t)settingsTipState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  v3 = objc_msgSend(v2, "settingsTipState");

  return (int64_t)v3;
}

- (void)setSettingsTipState:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  objc_msgSend(v4, "setSettingsTipState:", a3);

}

- (BOOL)automaticallyUpdateCompassInsets
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  v3 = objc_msgSend(v2, "automaticallyUpdateCompassInsets");

  return v3;
}

- (void)setAutomaticallyUpdateCompassInsets:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  objc_msgSend(v4, "setAutomaticallyUpdateCompassInsets:", v3);

}

- (void)didUpdateMapInsets
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay floatingControlsViewController](self, "floatingControlsViewController"));
  objc_msgSend(v2, "updateCompassInsets");

}

- (void)select3dMode
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "floatingControlsOverlayDidTapEnter3DMode:") & 1) != 0)
    objc_msgSend(v3, "floatingControlsOverlayDidTapEnter3DMode:", self);

}

- (void)exit3dMode
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "floatingControlsOverlayDidTapExit3DMode:") & 1) != 0)
    objc_msgSend(v3, "floatingControlsOverlayDidTapExit3DMode:", self);

}

- (void)viewControllerOpenSettings:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "floatingControlsOverlayDidTapOpenSettings:") & 1) != 0)
    objc_msgSend(v4, "floatingControlsOverlayDidTapOpenSettings:", self);

}

- (void)refreshCurrentSearch
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "floatingControlsOverlayDidTapRefreshCurrentSearch:") & 1) != 0)
    objc_msgSend(v3, "floatingControlsOverlayDidTapRefreshCurrentSearch:", self);

}

- (BOOL)shouldShowSearchOverlay
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v2, "shouldShowSearchOverlay") & 1) != 0)
    v3 = objc_msgSend(v2, "shouldShowSearchOverlay");
  else
    v3 = 0;

  return v3;
}

- (void)showRedoSearchOverlay:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "showRedoSearchOverlay:") & 1) != 0)
    objc_msgSend(v4, "showRedoSearchOverlay:", v3);

}

- (void)enterPedestrianAR:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "floatingControlsOverlay:didTapEnterPedestrianARFromButton:") & 1) != 0)
  {
    objc_msgSend(v4, "floatingControlsOverlay:didTapEnterPedestrianARFromButton:", self, v5);
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 126, 302, 0);
  }

}

- (void)createRadar
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "floatingControlsOverlayDidTapTTRButton:") & 1) != 0)
    objc_msgSend(v3, "floatingControlsOverlayDidTapTTRButton:", self);

}

- (void)toggleSSAO
{
  int BOOL;

  BOOL = GEOConfigGetBOOL(MapsFeaturesConfig_SSAOEnabled[0], MapsFeaturesConfig_SSAOEnabled[1]);
  GEOConfigSetBOOL(MapsFeaturesConfig_SSAOEnabled[0], MapsFeaturesConfig_SSAOEnabled[1], BOOL ^ 1u);
}

- (void)viewControllerCloseSettingsTip:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "floatingControlsOverlayDidTapCloseSettingsTip:") & 1) != 0)
    objc_msgSend(v4, "floatingControlsOverlayDidTapCloseSettingsTip:", self);

}

- (VenuesManager)venuesManager
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FloatingControlsOverlay delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "venuesManagerForFloatingControlsOverlay:") & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venuesManagerForFloatingControlsOverlay:", self));
  else
    v4 = 0;

  return (VenuesManager *)v4;
}

- (ControlContainerViewController)containerViewController
{
  return 0;
}

- (ChromeOverlayHosting)host
{
  return (ChromeOverlayHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (FloatingControlsOverlayDelegate)delegate
{
  return (FloatingControlsOverlayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MapViewProviding)mapViewProvider
{
  return (MapViewProviding *)objc_loadWeakRetained((id *)&self->_mapViewProvider);
}

- (double)margin
{
  return self->_margin;
}

- (FloatingControlsViewController)floatingControlsViewController
{
  return self->_floatingControlsViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingControlsViewController, 0);
  objc_destroyWeak((id *)&self->_mapViewProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_edgeConstraints, 0);
}

@end
