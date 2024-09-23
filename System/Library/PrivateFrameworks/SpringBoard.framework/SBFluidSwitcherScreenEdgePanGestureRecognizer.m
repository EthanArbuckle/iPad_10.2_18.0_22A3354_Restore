@implementation SBFluidSwitcherScreenEdgePanGestureRecognizer

- (id)viewForTouchHistory
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherScreenEdgePanGestureRecognizer;
  -[SBHomeGesturePanGestureRecognizer reset](&v3, sel_reset);
  self->_touchInterfaceOrientationWhenGestureBegan = 0;
}

- (void)setState:(int64_t)a3
{
  objc_super v5;

  if (a3 == 1)
    self->_touchInterfaceOrientationWhenGestureBegan = -[SBFluidSwitcherScreenEdgePanGestureRecognizer _touchInterfaceOrientation](self, "_touchInterfaceOrientation");
  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherScreenEdgePanGestureRecognizer;
  -[SBFluidSwitcherScreenEdgePanGestureRecognizer setState:](&v5, sel_setState_, a3);
}

- (int64_t)_touchInterfaceOrientation
{
  int64_t touchInterfaceOrientationWhenGestureBegan;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  touchInterfaceOrientationWhenGestureBegan = self->_touchInterfaceOrientationWhenGestureBegan;
  if (!touchInterfaceOrientationWhenGestureBegan)
  {
    -[SBFluidSwitcherScreenEdgePanGestureRecognizer switcherViewController](self, "switcherViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_sbWindowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "transientOverlayPresenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "hasActivePresentation"))
      {
        v9 = objc_msgSend(v8, "topmostViewControllerInterfaceOrientation");
      }
      else
      {
        objc_msgSend(v5, "layoutContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "layoutState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unlockedEnvironmentMode");

        if (v12 == 1)
          v9 = objc_msgSend(v6, "homeScreenInterfaceOrientationForContentController:", v5);
        else
          v9 = objc_msgSend(v6, "switcherInterfaceOrientationForSwitcherContentController:", v5);
      }
      touchInterfaceOrientationWhenGestureBegan = v9;

    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)SBFluidSwitcherScreenEdgePanGestureRecognizer;
      touchInterfaceOrientationWhenGestureBegan = -[SBHomeGesturePanGestureRecognizer _touchInterfaceOrientation](&v14, sel__touchInterfaceOrientation);
    }

  }
  return touchInterfaceOrientationWhenGestureBegan;
}

- (SBFluidSwitcherViewController)switcherViewController
{
  return (SBFluidSwitcherViewController *)objc_loadWeakRetained((id *)&self->_switcherViewController);
}

- (void)setSwitcherViewController:(id)a3
{
  objc_storeWeak((id *)&self->_switcherViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_switcherViewController);
}

@end
