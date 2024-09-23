@implementation SBDashBoardApplicationHostableEntity

- (SBDashBoardApplicationHostableEntity)initWithApplicationSceneEntity:(id)a3
{
  id v5;
  SBDashBoardApplicationHostableEntity *v6;
  SBDashBoardApplicationHostableEntity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardApplicationHostableEntity;
  v6 = -[SBDashBoardApplicationHostableEntity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_applicationSceneEntity, a3);

  return v7;
}

- (SBDisplayItem)displayItemRepresentation
{
  return (SBDisplayItem *)-[SBWorkspaceEntity displayItemRepresentation](self->_applicationSceneEntity, "displayItemRepresentation");
}

- (CSCoverSheetViewPresenting)hostingViewController
{
  _SBDashBoardHostedAppEntityViewController *hostedAppViewController;
  _SBDashBoardHostedAppEntityViewController *v4;
  _SBDashBoardHostedAppEntityViewController *v5;
  _SBDashBoardHostedAppEntityViewController *v6;
  void *v7;

  hostedAppViewController = self->_hostedAppViewController;
  if (!hostedAppViewController)
  {
    v4 = -[SBDashBoardHostedAppViewController initWithApplicationSceneEntity:]([_SBDashBoardHostedAppEntityViewController alloc], "initWithApplicationSceneEntity:", self->_applicationSceneEntity);
    -[SBDashBoardHostedAppViewController setHostContextProvider:](v4, "setHostContextProvider:", self);
    v5 = self->_hostedAppViewController;
    self->_hostedAppViewController = v4;
    v6 = v4;

    -[SBDashBoardHostedAppViewController setDelegate:](self->_hostedAppViewController, "setDelegate:", self);
    -[SBDashBoardHostedAppViewController applicationSceneHandle](self->_hostedAppViewController, "applicationSceneHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObserver:", self);
    hostedAppViewController = self->_hostedAppViewController;
  }
  return (CSCoverSheetViewPresenting *)hostedAppViewController;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v5;

  -[_SBDashBoardHostedAppEntityViewController entityPresenterDelegate](self->_hostedAppViewController, "entityPresenterDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "hostableEntityPresenter:didBeginHosting:", self->_hostedAppViewController, self);

}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  id v5;

  -[_SBDashBoardHostedAppEntityViewController entityPresenterDelegate](self->_hostedAppViewController, "entityPresenterDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "hostableEntityPresenter:didEndHosting:", self->_hostedAppViewController, self);

}

- (void)dashBoardHostedAppViewControllerDidFailToActivateApplication:(id)a3
{
  id v4;

  -[_SBDashBoardHostedAppEntityViewController entityPresenterDelegate](self->_hostedAppViewController, "entityPresenterDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "hostableEntityPresenter:didFailToActivate:", self->_hostedAppViewController, self);

}

- (BOOL)hostedAppShouldHideHomeGrabberView
{
  return 1;
}

- (NSString)hostedAppBundleIdentifier
{
  void *v2;
  void *v3;

  -[SBApplicationSceneEntity application](self->_applicationSceneEntity, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (SBApplicationSceneEntity)applicationSceneEntity
{
  return self->_applicationSceneEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationSceneEntity, 0);
  objc_storeStrong((id *)&self->_hostedAppViewController, 0);
}

@end
