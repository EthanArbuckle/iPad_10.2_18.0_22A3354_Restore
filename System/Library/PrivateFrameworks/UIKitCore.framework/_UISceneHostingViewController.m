@implementation _UISceneHostingViewController

- (id)initWithSceneHostingController:(void *)a1
{
  id *v3;
  id *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)_UISceneHostingViewController;
  v3 = (id *)objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
  v4 = v3;
  if (v3)
    objc_storeWeak(v3 + 121, a2);
  return v4;
}

- (void)loadView
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  objc_msgSend(WeakRetained, "sceneView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController setView:](self, "setView:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _UISceneHostingController **p_sceneHostingController;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UISceneHostingViewController;
  -[UIViewController viewWillAppear:](&v15, sel_viewWillAppear_, a3);
  p_sceneHostingController = &self->_sceneHostingController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  v6 = objc_opt_self();
  +[_UISceneHostingViewAppearanceActionHostToClient _actionForActionType:](v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sendAction:", v7);

  if (self)
  {
    -[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    v10 = v8;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    v13 = objc_loadWeakRetained((id *)p_sceneHostingController);
    objc_msgSend(v13, "_remoteSheetProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (v12)
        objc_msgSend(v12, "_tryToConnectToRemoteSheet:", v14);
    }

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISceneHostingViewController;
  -[UIViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  v5 = objc_opt_self();
  +[_UISceneHostingViewAppearanceActionHostToClient _actionForActionType:](v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sendAction:", v6);

}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISceneHostingViewController;
  -[UIViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  v5 = objc_opt_self();
  +[_UISceneHostingViewAppearanceActionHostToClient _actionForActionType:](v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sendAction:", v6);

}

+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return 1;
}

- (void)_childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UISceneHostingViewController;
  -[UIViewController _childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:](&v16, sel__childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter_);
  v5 = a3;
  if (v5)
  {
    do
    {
      objc_msgSend(v5, "_existingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        break;
      objc_msgSend(v5, "parentViewController");
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
    }
    while (v8);
  }
  objc_msgSend(v5, "_existingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  v12 = WeakRetained;
  if (WeakRetained)
    v13 = (void *)*((_QWORD *)WeakRetained + 9);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v14, "_relationshipManagementHostComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_willMoveToWindowWithDelayedPresentation:", v10);

}

- (int64_t)interfaceElementCategory
{
  return 3;
}

- (_UIRemoteSheet)_remoteSheet
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  objc_msgSend(WeakRetained, "_remoteSheetProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIRemoteSheet *)v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneHostingController);
}

@end
