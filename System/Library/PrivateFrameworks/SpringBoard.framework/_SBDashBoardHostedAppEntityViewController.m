@implementation _SBDashBoardHostedAppEntityViewController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SBDashBoardHostedAppEntityViewController;
  -[SBDashBoardHostedAppViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
    -[CSCoverSheetViewControllerBase _setDisplayLayoutElementActive:immediately:](self, "_setDisplayLayoutElementActive:immediately:", -[CSCoverSheetViewControllerBase isDisplayLayoutElementActive](self, "isDisplayLayoutElementActive"), 1);
}

- (BOOL)appViewControllerShouldBackgroundApplicationOnDeactivate:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (self->_preventSceneBackgrounding
    || !objc_msgSend((id)-[_SBDashBoardHostedAppEntityViewController superclass](self, "superclass"), "instancesRespondToSelector:", sel_appViewControllerShouldBackgroundApplicationOnDeactivate_))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SBDashBoardHostedAppEntityViewController;
    v5 = -[SBDashBoardHostedAppViewController appViewControllerShouldBackgroundApplicationOnDeactivate:](&v7, sel_appViewControllerShouldBackgroundApplicationOnDeactivate_, v4);
  }

  return v5;
}

- (int64_t)hostableEntityContentMode
{
  int64_t result;

  result = -[SBDashBoardHostedAppViewController mode](self, "mode");
  if (result != 2)
    return result == 1;
  return result;
}

- (void)setHostableEntityContentMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
    -[SBDashBoardHostedAppViewController setMode:](self, "setMode:", qword_1D0E8A748[a3]);
}

- (void)setActionsToDeliverToHostableEntity:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SBDashBoardHostedAppViewController setActionsToDeliver:](self, "setActionsToDeliver:", v4);

}

- (SBHomeGrabberView)homeGrabberViewForTraitsParticipant
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  -[SBDashBoardHostedAppViewController appView](self, "appView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[SBDashBoardHostedAppViewController applicationSceneHandle](self, "applicationSceneHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    v7 = v5;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    objc_msgSend(v4, "homeGrabberView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
    v10 = 0;
  }

  return (SBHomeGrabberView *)v10;
}

- (void)invalidateForReplacementByEntity:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = objc_opt_class();
  v12 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v12;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "applicationSceneEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sceneHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardHostedAppViewController applicationSceneHandle](self, "applicationSceneHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
    self->_preventSceneBackgrounding = 1;
  -[SBDashBoardHostedAppViewController invalidate](self, "invalidate");

}

- (CSHostableEntityPresenterDelegate)entityPresenterDelegate
{
  return (CSHostableEntityPresenterDelegate *)objc_loadWeakRetained((id *)&self->_entityPresenterDelegate);
}

- (void)setEntityPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_entityPresenterDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_entityPresenterDelegate);
}

@end
