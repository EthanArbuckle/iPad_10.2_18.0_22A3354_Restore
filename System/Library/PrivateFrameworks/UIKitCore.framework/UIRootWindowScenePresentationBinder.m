@implementation UIRootWindowScenePresentationBinder

- (id)_initWithIdentifier:(id)a3 priority:(int64_t)a4 appearanceStyle:(unint64_t)a5 rootWindow:(id)a6
{
  id v11;
  id v12;
  void *v13;
  UIRootWindowScenePresentationBinder *v14;
  NSMutableSet *v15;
  NSMutableSet *presentedScenes;
  uint64_t v17;
  FBSDisplayConfiguration *displayConfiguration;
  objc_super v20;

  v11 = a6;
  v12 = a3;
  objc_msgSend(v11, "_sceneContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)UIRootWindowScenePresentationBinder;
  v14 = -[UIScenePresentationBinder initWithIdentifier:priority:rootView:appearanceStyle:](&v20, sel_initWithIdentifier_priority_rootView_appearanceStyle_, v12, a4, v13, a5);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_rootSceneWindow, a6);
    v14->_shouldManageWindowLifecycle = v11 == 0;
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    presentedScenes = v14->_presentedScenes;
    v14->_presentedScenes = v15;

    objc_msgSend(v11, "displayConfiguration");
    v17 = objc_claimAutoreleasedReturnValue();
    displayConfiguration = v14->_displayConfiguration;
    v14->_displayConfiguration = (FBSDisplayConfiguration *)v17;

  }
  return v14;
}

- (UIRootWindowScenePresentationBinder)initWithPriority:(int64_t)a3 displayConfiguration:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UIRootWindowScenePresentationBinder *v11;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("RootWindow-%@-%p"), v9, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIRootWindowScenePresentationBinder _initWithIdentifier:priority:appearanceStyle:rootWindow:](self, "_initWithIdentifier:priority:appearanceStyle:rootWindow:", v10, a3, 0, 0);

  if (v11)
    objc_storeStrong((id *)&v11->_displayConfiguration, a4);

  return v11;
}

- (UIMutableTransformer)sceneTransformer
{
  return -[UIRootSceneWindow sceneTransformer](self->_rootSceneWindow, "sceneTransformer");
}

- (void)invalidate
{
  UIRootSceneWindow *rootSceneWindow;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIRootWindowScenePresentationBinder;
  -[UIScenePresentationBinder invalidate](&v4, sel_invalidate);
  if (self->_shouldManageWindowLifecycle)
  {
    rootSceneWindow = self->_rootSceneWindow;
    self->_rootSceneWindow = 0;

  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  UIRootWindowScenePresentationBinder *v11;

  -[UIScenePresentationBinder succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__UIRootWindowScenePresentationBinder_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

id __77__UIRootWindowScenePresentationBinder_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), CFSTR("displayConfiguration"), 0);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96), CFSTR("rootWindow"), 0);
}

- (id)_rootView
{
  return -[UIRootSceneWindow _sceneContainerView](self->_rootSceneWindow, "_sceneContainerView");
}

- (void)_noteWillStartPresentingScene:(id)a3
{
  UIRootSceneWindow *v4;
  UIRootSceneWindow *rootSceneWindow;

  -[NSMutableSet addObject:](self->_presentedScenes, "addObject:", a3);
  if (self->_shouldManageWindowLifecycle && !self->_rootSceneWindow)
  {
    v4 = -[UIRootSceneWindow initWithDisplayConfiguration:]([UIRootSceneWindow alloc], "initWithDisplayConfiguration:", self->_displayConfiguration);
    rootSceneWindow = self->_rootSceneWindow;
    self->_rootSceneWindow = v4;

  }
  if (-[UIView isHidden](self->_rootSceneWindow, "isHidden"))
    -[_UIRootWindow setHidden:](self->_rootSceneWindow, "setHidden:", 0);
}

- (void)_noteDidStopPresentingScene:(id)a3
{
  UIRootSceneWindow *rootSceneWindow;

  -[NSMutableSet removeObject:](self->_presentedScenes, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_presentedScenes, "count") && self->_shouldManageWindowLifecycle)
  {
    if (-[UIScenePresentationBinder _delegateShouldPresentSceneOnlyWhenLayersExist](self, "_delegateShouldPresentSceneOnlyWhenLayersExist"))
    {
      -[_UIRootWindow setHidden:](self->_rootSceneWindow, "setHidden:", 1);
      rootSceneWindow = self->_rootSceneWindow;
      self->_rootSceneWindow = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedScenes, 0);
  objc_storeStrong((id *)&self->_rootSceneWindow, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

@end
