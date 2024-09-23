@implementation _UIViewControllerTransition

+ (id)zoomWithSourceViewProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "set_viewProvider:", v3);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "_setOptions:", v5);

  return v4;
}

- (void)_setOptions:(id)a3
{
  _UIViewControllerTransitionOptions *v4;
  _UIViewControllerTransitionOptions **p_options;
  _UIViewControllerTransitionOptions *options;
  _UIViewControllerTransitionOptions *obj;

  v4 = (_UIViewControllerTransitionOptions *)a3;
  options = self->_options;
  p_options = &self->_options;
  if (options != v4)
  {
    if (!v4)
      v4 = (_UIViewControllerTransitionOptions *)objc_opt_new();
    obj = v4;
    objc_storeStrong((id *)p_options, v4);
    v4 = obj;
  }

}

- (id)_apiTransition
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_opt_new();
  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45___UIViewControllerTransition__apiTransition__block_invoke;
  v16[3] = &unk_1E16ED768;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v3, "setInteractiveDismissShouldBegin:", v16);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __45___UIViewControllerTransition__apiTransition__block_invoke_2;
  v14[3] = &unk_1E16ED790;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "setAlignmentRectProvider:", v14);
  -[_UIViewControllerTransition _options](self, "_options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dimmingColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDimmingColor:", v6);

  -[_UIViewControllerTransition _options](self, "_options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dimmingVisualEffects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setDimmingVisualEffect:", v9);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __45___UIViewControllerTransition__apiTransition__block_invoke_3;
  v12[3] = &unk_1E16ED7B8;
  objc_copyWeak(&v13, &location);
  +[UIViewControllerTransition zoomWithOptions:sourceViewProvider:](UIViewControllerTransition, "zoomWithOptions:sourceViewProvider:", v3, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[_UIViewControllerTransition _viewProvider](self, "_viewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_viewProvider:", v5);

  -[_UIViewControllerTransition _options](self, "_options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setOptions:", v6);

  -[_UIViewControllerTransition _interactiveDismissShouldBeginHandler](self, "_interactiveDismissShouldBeginHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_interactiveDismissShouldBeginHandler:", v7);

  return v4;
}

- (_UIViewControllerTransitionOptions)_options
{
  return self->_options;
}

- (UIViewController)_associatedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__associatedViewController);
}

- (void)set_associatedViewController:(id)a3
{
  objc_storeWeak((id *)&self->__associatedViewController, a3);
}

- (id)_viewProvider
{
  return self->__viewProvider;
}

- (void)set_viewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)_interactiveDismissShouldBeginHandler
{
  return self->__interactiveDismissShouldBeginHandler;
}

- (void)set_interactiveDismissShouldBeginHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__interactiveDismissShouldBeginHandler, 0);
  objc_storeStrong(&self->__viewProvider, 0);
  objc_destroyWeak((id *)&self->__associatedViewController);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
