@implementation _UIEditMenuInProcessPresentation

- (id)containerView
{
  return self->_menuContainerView;
}

- (BOOL)canPresentEditMenu
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_8;
      -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEditMenuPresentation sourceView](self, "sourceView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", (uint8_t *)&v11, 0x16u);
LABEL_7:

LABEL_8:
      goto LABEL_9;
    }
    v5 = canPresentEditMenu___s_category;
    if (!canPresentEditMenu___s_category)
    {
      v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&canPresentEditMenu___s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEditMenuPresentation sourceView](self, "sourceView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", (uint8_t *)&v11, 0x16u);
      goto LABEL_7;
    }
  }
LABEL_9:

  return v4 != 0;
}

- (id)configureContainerViewWithConfiguration:(id)a3
{
  id v4;
  _UIEditMenuContainerView **p_menuContainerView;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _UIEditMenuContainerView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  _UIEditMenuContainerView *v18;
  _UIEditMenuContainerView *touchPassthroughView;
  _UIEditMenuContainerView *v20;

  v4 = a3;
  p_menuContainerView = &self->_menuContainerView;
  if (!self->_menuContainerView)
  {
    -[_UIEditMenuPresentation sourceView](self, "sourceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_overrideSourceWindow");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v7;
    v11 = v10;

    v12 = -[_UIEditMenuContainerView initWithPresentation:enablePassthrough:]([_UIEditMenuContainerView alloc], "initWithPresentation:enablePassthrough:", self, v7 == v11);
    if (objc_msgSend(v11, "_isTextEffectsWindow"))
      objc_msgSend(v11, "_usableSceneBounds");
    else
      objc_msgSend(v11, "bounds");
    -[_UIEditMenuContainerView setFrame:](v12, "setFrame:");
    -[UIView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
    -[_UIEditMenuPresentation sourceView](self, "sourceView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEditMenuGetPlatformMetrics(objc_msgSend(v14, "userInterfaceIdiom"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "containerViewConfigurator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v15, "containerViewConfigurator");
      v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _UIEditMenuContainerView *))v17)[2](v17, v12);

    }
    objc_msgSend(v11, "addSubview:", v12);
    objc_storeStrong((id *)&self->_menuContainerView, v12);
    if (v7 != v11)
    {
      v18 = -[_UIEditMenuContainerView initWithPresentation:enablePassthrough:]([_UIEditMenuContainerView alloc], "initWithPresentation:enablePassthrough:", self, 1);
      objc_msgSend(v7, "_usableSceneBounds");
      -[_UIEditMenuContainerView setFrame:](v18, "setFrame:");
      -[UIView setAutoresizingMask:](v18, "setAutoresizingMask:", 18);
      objc_msgSend(v7, "addSubview:", v18);
      touchPassthroughView = self->_touchPassthroughView;
      self->_touchPassthroughView = v18;

    }
  }
  -[_UIEditMenuContainerView setIgnoresPassthroughInPresentationSource:](*p_menuContainerView, "setIgnoresPassthroughInPresentationSource:", objc_msgSend(v4, "_ignoresPassthroughInView"));
  -[_UIEditMenuContainerView setIgnoresPassthroughInPresentationSource:](self->_touchPassthroughView, "setIgnoresPassthroughInPresentationSource:", objc_msgSend(v4, "_ignoresPassthroughInView"));
  v20 = *p_menuContainerView;

  return v20;
}

- (void)teardownContainerView
{
  _UIEditMenuContainerView *menuContainerView;
  _UIEditMenuContainerView *touchPassthroughView;

  -[UIView removeFromSuperview](self->_menuContainerView, "removeFromSuperview");
  menuContainerView = self->_menuContainerView;
  self->_menuContainerView = 0;

  -[UIView removeFromSuperview](self->_touchPassthroughView, "removeFromSuperview");
  touchPassthroughView = self->_touchPassthroughView;
  self->_touchPassthroughView = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchPassthroughView, 0);
  objc_storeStrong((id *)&self->_menuContainerView, 0);
}

@end
