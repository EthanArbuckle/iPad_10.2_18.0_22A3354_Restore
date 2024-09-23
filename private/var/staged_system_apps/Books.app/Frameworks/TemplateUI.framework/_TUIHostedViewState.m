@implementation _TUIHostedViewState

- (_TUIHostedViewState)initWithController:(id)a3 provider:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TUIHostedViewState *v11;
  _TUIHostedViewState *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_TUIHostedViewState;
  v11 = -[_TUIHostedViewState init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_controller, v8);
    objc_storeStrong((id *)&v12->_provider, a4);
    objc_storeStrong((id *)&v12->_identifier, a5);
    v12->_anchorPoint = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
  }

  return v12;
}

- (void)dealloc
{
  UIViewController *viewController;
  void *v4;
  UIViewController *v5;
  void *v6;
  void *v7;
  UIViewController *v8;
  id WeakRetained;
  UIViewController *v10;
  objc_super v11;
  _QWORD v12[4];
  UIViewController *v13;

  -[_TUIHostedViewState setVisible:](self, "setVisible:", 0);
  viewController = self->_viewController;
  if (viewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](viewController, "parentViewController"));

    v5 = self->_viewController;
    if (v4)
    {
      if (-[UIViewController _appearState](v5, "_appearState") == 2)
      {
        -[UIViewController beginAppearanceTransition:animated:](self->_viewController, "beginAppearanceTransition:animated:", 0, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](self->_viewController, "viewIfLoaded"));
        objc_msgSend(v6, "removeFromSuperview");

        -[UIViewController endAppearanceTransition](self->_viewController, "endAppearanceTransition");
      }
      -[UIViewController removeFromParentViewController](self->_viewController, "removeFromParentViewController");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v5, "presentingViewController"));

      if (v7)
      {
        v8 = self->_viewController;
        WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_C0C28;
        v12[3] = &unk_23D938;
        v13 = v8;
        v10 = v8;
        objc_msgSend(WeakRetained, "_finishOngoingModalTransitionAnimationsWithCompletion:", v12);

        -[_TUIHostedViewState presentationDidDismiss](self, "presentationDidDismiss");
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)_TUIHostedViewState;
  -[_TUIHostedViewState dealloc](&v11, "dealloc");
}

- (void)recycleViewWithController:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[_TUIHostedViewState view](self, "view", a3));
  objc_msgSend(v3, "removeFromSuperview");

}

- (BOOL)needsLayout
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIHostedViewState viewController](self, "viewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewIfLoaded"));
  v4 = objc_msgSend(v3, "isHidden");

  return v4;
}

- (BOOL)isAvailable
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIHostedViewState viewController](self, "viewController"));
  v3 = v2 != 0;

  return v3;
}

- (void)setVisible:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_visible != a3)
  {
    v3 = a3;
    self->_visible = a3;
    if ((objc_opt_respondsToSelector(self->_provider, "hostedViewProviderDidChangeVisibility:viewController:") & 1) != 0)
      -[TUIHostedViewProviding hostedViewProviderDidChangeVisibility:viewController:](self->_provider, "hostedViewProviderDidChangeVisibility:viewController:", v3, self->_viewController);
  }
}

- (UIViewController)viewController
{
  UIViewController *viewController;
  id WeakRetained;
  void *v5;
  id v6;
  unsigned int v7;
  UIViewController *v8;
  UIViewController *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  viewController = self->_viewController;
  if (!viewController)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_groupIdentifierForIdentifier:", self->_identifier));

    if (!v5
      || (v6 = objc_loadWeakRetained((id *)&self->_controller),
          v7 = objc_msgSend(v6, "_shouldVendViewForIdentifier:inGroup:", self->_identifier, v5),
          v6,
          v7))
    {
      if (self->_viewController
        || (v8 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[TUIHostedViewProviding hostedViewProviderCreateViewController](self->_provider, "hostedViewProviderCreateViewController")), v9 = self->_viewController, self->_viewController = v8, v9, self->_viewController))
      {
        v10 = objc_loadWeakRetained((id *)&self->_controller);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_propertiesForIdentifier:", self->_identifier));
        v12 = objc_msgSend(v11, "presentation");

        if (!v12)
        {
          v13 = objc_loadWeakRetained((id *)&self->_controller);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewController"));
          objc_msgSend(v14, "addChildViewController:", self->_viewController);

        }
        if (v5)
        {
          v15 = objc_loadWeakRetained((id *)&self->_controller);
          objc_msgSend(v15, "_activateGroup:", v5);

        }
        -[_TUIHostedViewState _updateAnchorPoint](self, "_updateAnchorPoint");
      }
    }

    viewController = self->_viewController;
  }
  return viewController;
}

- (UIView)view
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIHostedViewState viewController](self, "viewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return (UIView *)v3;
}

- (unint64_t)flags
{
  return (unint64_t)-[TUIHostedViewProviding hostedViewProviderFlags](self->_provider, "hostedViewProviderFlags");
}

- (TUIVisibilityOptions)visibilityOptions
{
  void *v3;

  if ((objc_opt_respondsToSelector(self->_provider, "hostedViewProviderVisibilityOptions") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostedViewProviding hostedViewProviderVisibilityOptions](self->_provider, "hostedViewProviderVisibilityOptions"));
  else
    v3 = 0;
  return (TUIVisibilityOptions *)v3;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id WeakRetained;

  -[_TUIHostedViewState setVisible:](self, "setVisible:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "_removeProviderForViewState:", self);

}

- (void)presentationDidDismiss
{
  id WeakRetained;

  -[_TUIHostedViewState setVisible:](self, "setVisible:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "_removeProviderForViewState:", self);

}

- (void)setAnchorPoint:(CGPoint)a3
{
  if (self->_anchorPoint.x != a3.x || self->_anchorPoint.y != a3.y)
  {
    self->_anchorPoint = a3;
    -[_TUIHostedViewState _updateAnchorPoint](self, "_updateAnchorPoint");
  }
}

- (void)_updateAnchorPoint
{
  if ((objc_opt_respondsToSelector(self->_provider, "hostedViewProviderCustomizeViewController:withAnchorPoint:") & 1) != 0)
    -[TUIHostedViewProviding hostedViewProviderCustomizeViewController:withAnchorPoint:](self->_provider, "hostedViewProviderCustomizeViewController:withAnchorPoint:", self->_viewController, self->_anchorPoint.x, self->_anchorPoint.y);
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)visible
{
  return self->_visible;
}

- (BOOL)previouslyAppeared
{
  return self->_previouslyAppeared;
}

- (void)setPreviouslyAppeared:(BOOL)a3
{
  self->_previouslyAppeared = a3;
}

- (TUIHostingController)controller
{
  return (TUIHostingController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (TUIHostedViewProviding)provider
{
  return self->_provider;
}

- (TUIHostingIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
