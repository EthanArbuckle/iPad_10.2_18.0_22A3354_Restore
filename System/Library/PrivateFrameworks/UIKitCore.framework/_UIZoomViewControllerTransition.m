@implementation _UIZoomViewControllerTransition

+ (id)zoomWithOptions:(id)a3 sourceViewProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_init");
  objc_msgSend(v8, "set_viewProvider:", v7);

  if (v6)
  {
    objc_msgSend(v8, "set_options:", v6);
  }
  else
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v8, "set_options:", v9);

  }
  return v8;
}

- (id)_transitionControllerForViewController:(id)a3 inContainer:(id)a4 isAppearing:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a5;
  v7 = a3;
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[_UIZoomViewControllerTransition _isSupportedGivenTraits:](self, "_isSupportedGivenTraits:", v8);

  if (!(_DWORD)self
    || (objc_msgSend(v7, "_overrideUseCustomPresentation") & 1) != 0
    || (objc_msgSend(v7, "_overrideTransitioningDelegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "_zoomTransitionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIsZoomingIn:", v5);
  }

  return v10;
}

- (void)_wasAssignedToViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[_UIZoomViewControllerTransition _associatedViewController](self, "_associatedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIZoomViewControllerTransition _associatedViewController](self, "_associatedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_zoomTransitionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "dismissInteraction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dismissInteraction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeInteraction:", v9);

    }
    -[_UIZoomViewControllerTransition set_associatedViewController:](self, "set_associatedViewController:", 0);

  }
  v10 = v17;
  if (v17)
  {
    objc_msgSend(v17, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_UIZoomViewControllerTransition _isSupportedGivenTraits:](self, "_isSupportedGivenTraits:", v11);

    v10 = v17;
    if (v12)
    {
      -[_UIZoomViewControllerTransition set_associatedViewController:](self, "set_associatedViewController:", v17);
      objc_msgSend(v17, "_zoomTransitionController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dismissInteraction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDelegate:", v13);

      objc_msgSend(v13, "setClientTransition:", self);
      objc_msgSend(v13, "setOwningViewController:", v17);
      objc_msgSend(v17, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dismissInteraction");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addInteraction:", v16);

      v10 = v17;
    }
  }

}

- (void)_viewControllerViewWillAppear
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[_UIZoomViewControllerTransition _associatedViewController](self, "_associatedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_UIZoomViewControllerTransition _isSupportedGivenTraits:](self, "_isSupportedGivenTraits:", v4);

    v3 = v9;
    if (v5)
    {
      objc_msgSend(v9, "_zoomTransitionController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dismissInteraction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setStyles:", 7);

      objc_msgSend(v9, "parentViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_msgSend(v6, "setIsForNavigation:", objc_opt_isKindOfClass() & 1);

      v3 = v9;
    }
  }

}

- (BOOL)_isSupportedGivenTraits:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (+[UIView _uip_transitionEnabled]())
    v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1 || objc_msgSend(v3, "userInterfaceIdiom") == 0;
  else
    v4 = 0;

  return v4;
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (id)_viewProvider
{
  return self->__viewProvider;
}

- (void)set_viewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIZoomTransitionOptions)_options
{
  return self->__options;
}

- (void)set_options:(id)a3
{
  objc_storeStrong((id *)&self->__options, a3);
}

- (UIViewController)_associatedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__associatedViewController);
}

- (void)set_associatedViewController:(id)a3
{
  objc_storeWeak((id *)&self->__associatedViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__associatedViewController);
  objc_storeStrong((id *)&self->__options, 0);
  objc_storeStrong(&self->__viewProvider, 0);
}

@end
