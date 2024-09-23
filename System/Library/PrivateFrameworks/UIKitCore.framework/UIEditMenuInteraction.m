@implementation UIEditMenuInteraction

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  if (!a4)
  {
    v7[7] = v4;
    v7[8] = v5;
    if (-[UIEditMenuInteraction isDisplayingMenu](self, "isDisplayingMenu", a3))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __53__UIEditMenuInteraction__didMoveFromWindow_toWindow___block_invoke;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);
    }
  }
}

- (void)didMoveToView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_storeWeak((id *)&self->_view, v5);
  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "addInteraction:", self->_contextMenuInteraction);
    v4 = v5;
  }

}

- (void)_updateContextMenuInteractionDrivers
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[UIEditMenuInteraction presentsContextMenuAsSecondaryAction](self, "presentsContextMenuAsSecondaryAction"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v4, "addObject:", v3);

  }
  -[UIContextMenuInteraction setDrivers:](self->_contextMenuInteraction, "setDrivers:", v4);

}

- (BOOL)presentsContextMenuAsSecondaryAction
{
  return self->_presentsContextMenuAsSecondaryAction;
}

- (BOOL)isDisplayingMenu
{
  void *v3;
  void *v4;
  BOOL v5;

  -[UIEditMenuInteraction activeEditMenuPresentation](self, "activeEditMenuPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayedMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 1;
  else
    v5 = -[UIContextMenuInteraction _hasVisibleMenu](self->_contextMenuInteraction, "_hasVisibleMenu");

  return v5;
}

- (_UIEditMenuPresentation)activeEditMenuPresentation
{
  return self->_activeEditMenuPresentation;
}

void __49__UIEditMenuInteraction__registerPlatformMetrics__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  objc_msgSend(v0, "registerVisualStyleClass:forStylableClass:", v1, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "registerVisualStyleClass:forStylableClass:", v3, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  objc_msgSend(v5, "registerVisualStyleClass:forStylableClass:", v4, objc_opt_class());

}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("UIEditMenuInteraction");
}

- (UIEditMenuInteraction)initWithDelegate:(id)delegate
{
  id v4;
  UIEditMenuInteraction *v5;
  UIEditMenuInteraction *v6;
  _UIEditMenuBridgedContextMenuInteraction *v7;
  void *v8;
  UIContextMenuInteraction *contextMenuInteraction;
  _UIEditMenuBridgedContextMenuInteraction *v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  objc_super v21;

  v4 = delegate;
  v21.receiver = self;
  v21.super_class = (Class)UIEditMenuInteraction;
  v5 = -[UIEditMenuInteraction init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_presentsContextMenuAsSecondaryAction = 1;
    v7 = -[UIContextMenuInteraction initWithDelegate:]([_UIEditMenuBridgedContextMenuInteraction alloc], "initWithDelegate:", v6);
    -[UIEditMenuInteraction _proxySender](v6, "_proxySender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuBridgedContextMenuInteraction setProxySender:](v7, "setProxySender:", v8);

    contextMenuInteraction = v6->_contextMenuInteraction;
    v6->_contextMenuInteraction = &v7->super;
    v10 = v7;

    -[UIEditMenuInteraction _updateContextMenuInteractionDrivers](v6, "_updateContextMenuInteractionDrivers");
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 2;
    else
      v11 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFD | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 4;
    else
      v12 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFB | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 8;
    else
      v13 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFF7 | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 16;
    else
      v14 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFEF | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 32;
    else
      v15 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFDF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 64;
    else
      v16 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFBF | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 128;
    else
      v17 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFF7F | v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 256;
    else
      v18 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFEFF | v18;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 512;
    else
      v19 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFDFF | v19;
    +[UIEditMenuInteraction _registerPlatformMetrics]();

  }
  return v6;
}

+ (void)_registerPlatformMetrics
{
  objc_opt_self();
  if (_registerPlatformMetrics___defaultRegistrationToken != -1)
    dispatch_once(&_registerPlatformMetrics___defaultRegistrationToken, &__block_literal_global_126_1);
}

- (void)setPresentsContextMenuAsSecondaryAction:(BOOL)a3
{
  if (self->_presentsContextMenuAsSecondaryAction != a3)
  {
    self->_presentsContextMenuAsSecondaryAction = a3;
    -[UIEditMenuInteraction _updateContextMenuInteractionDrivers](self, "_updateContextMenuInteractionDrivers");
  }
}

- (void)_viewTraitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[UIEditMenuInteraction isDisplayingMenu](self, "isDisplayingMenu"))
  {
    -[UIEditMenuInteraction activeEditMenuPresentation](self, "activeEditMenuPresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceViewDidUpdateFromTraitCollection:", v5);

  }
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  id WeakRetained;
  _BOOL4 v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  -[UIContextMenuInteraction view](self->_contextMenuInteraction, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInteraction:", self->_contextMenuInteraction);

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained == v7)
  {

  }
  else
  {
    v6 = -[UIEditMenuInteraction isDisplayingMenu](self, "isDisplayingMenu");

    if (v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __40__UIEditMenuInteraction_willMoveToView___block_invoke;
      v8[3] = &unk_1E16B1B28;
      v8[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
    }
  }
  objc_storeWeak((id *)&self->_view, 0);

}

- (void)set_includeMenuControllerItems:(BOOL)a3
{
  self->__includeMenuControllerItems = a3;
}

- (void)_setProxySender:(id)a3
{
  UIContextMenuInteraction *contextMenuInteraction;
  id v5;

  objc_storeWeak(&self->__proxySender, a3);
  contextMenuInteraction = self->_contextMenuInteraction;
  -[UIEditMenuInteraction _proxySender](self, "_proxySender");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIContextMenuInteraction setProxySender:](contextMenuInteraction, "setProxySender:", v5);

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__selectedMenuLeaf);
  objc_storeStrong((id *)&self->__outgoingPresentation, 0);
  objc_storeStrong((id *)&self->_activeEditMenuPresentation, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_pendingConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->__proxySender);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
}

+ (BOOL)_isOutOfProcessEditMenusEnabled
{
  if (qword_1ECD82538 != -1)
    dispatch_once(&qword_1ECD82538, &__block_literal_global_659);
  return _MergedGlobals_1326;
}

uint64_t __56__UIEditMenuInteraction__isOutOfProcessEditMenusEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  _MergedGlobals_1326 = result;
  return result;
}

uint64_t __40__UIEditMenuInteraction_willMoveToView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissMenu");
}

uint64_t __53__UIEditMenuInteraction__didMoveFromWindow_toWindow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissMenu");
}

- (void)presentEditMenuWithConfiguration:(UIEditMenuConfiguration *)configuration
{
  UIEditMenuConfiguration *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  UIEditMenuConfiguration *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = configuration;
  -[UIEditMenuInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_storeStrong((id *)&self->_pendingConfiguration, configuration);
    -[UIEditMenuConfiguration sourcePoint](v5, "sourcePoint");
    v8 = v7;
    v10 = v9;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__UIEditMenuInteraction_presentEditMenuWithConfiguration___block_invoke;
    v16[3] = &unk_1E16CD1E8;
    v16[4] = self;
    v17 = v5;
    -[UIEditMenuInteraction _prepareMenuAtLocation:configuration:completionHandler:](self, "_prepareMenuAtLocation:configuration:completionHandler:", v17, v16, v8, v10);

    goto LABEL_10;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    -[UIEditMenuInteraction activeConfiguration](self, "activeConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEditMenuInteraction view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", buf, 0x16u);
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  v11 = presentEditMenuWithConfiguration____s_category;
  if (!presentEditMenuWithConfiguration____s_category)
  {
    v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&presentEditMenuWithConfiguration____s_category);
  }
  v12 = *(NSObject **)(v11 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    -[UIEditMenuInteraction activeConfiguration](self, "activeConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEditMenuInteraction view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", buf, 0x16u);
    goto LABEL_8;
  }
LABEL_10:

}

void __58__UIEditMenuInteraction_presentEditMenuWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _UIEditMenuInProcessPresentation *v5;
  _UIEditMenuOverlayUIClientPresentation *v6;
  void *v7;
  void *v8;
  _UIEditMenuInProcessPresentation *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v4 + 64))
    {
      v14 = v3;
      v5 = (_UIEditMenuInProcessPresentation *)*(id *)(v4 + 80);
      if (!v5)
      {
        if (!+[UIEditMenuInteraction _isOutOfProcessEditMenusEnabled](UIEditMenuInteraction, "_isOutOfProcessEditMenusEnabled")|| (v6 = [_UIEditMenuOverlayUIClientPresentation alloc], v7 = *(void **)(a1 + 32), objc_msgSend(v7, "view"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v5 = -[_UIEditMenuOverlayUIClientPresentation initWithDelegate:sourceView:](v6, "initWithDelegate:sourceView:", v7, v8), v8, !v5))
        {
          v9 = [_UIEditMenuInProcessPresentation alloc];
          v10 = *(void **)(a1 + 32);
          objc_msgSend(v10, "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = -[_UIEditMenuPresentation initWithDelegate:sourceView:](v9, "initWithDelegate:sourceView:", v10, v11);

        }
        -[_UIEditMenuPresentation setEnforcesMenuControllerLifecycle:](v5, "setEnforcesMenuControllerLifecycle:", objc_msgSend(*(id *)(a1 + 32), "_enforcesMenuControllerLifecycle"));
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), v5);
      }
      -[_UIEditMenuContentPresentation displayMenu:configuration:](v5, "displayMenu:configuration:", v14, *(_QWORD *)(a1 + 40));
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 64);
      *(_QWORD *)(v12 + 64) = 0;

      v3 = v14;
    }
  }

}

- (void)dismissMenu
{
  -[UIEditMenuInteraction _dismissMenuWithPresentationType:](self, "_dismissMenuWithPresentationType:", 0);
}

- (void)reloadVisibleMenu
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[UIEditMenuInteraction activeConfiguration](self, "activeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "sourcePoint");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__UIEditMenuInteraction_reloadVisibleMenu__block_invoke;
    v5[3] = &unk_1E16BC7B8;
    v5[4] = self;
    -[UIEditMenuInteraction _prepareMenuAtLocation:configuration:completionHandler:](self, "_prepareMenuAtLocation:configuration:completionHandler:", v4, v5);
  }

}

void __42__UIEditMenuInteraction_reloadVisibleMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__UIEditMenuInteraction_reloadVisibleMenu__block_invoke_2;
  v6[3] = &unk_1E16B50F0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_updateVisibleMenuWithReason:updateBlock:", 1, v6);

}

id __42__UIEditMenuInteraction_reloadVisibleMenu__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updateVisibleMenuPositionAnimated:(BOOL)animated
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = animated;
  -[UIEditMenuInteraction activeEditMenuPresentation](self, "activeEditMenuPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedMenu");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIEditMenuInteraction activeEditMenuPresentation](self, "activeEditMenuPresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateMenuPositionAnimated:", v3);

  }
}

- (CGPoint)locationInView:(UIView *)view
{
  UIView *v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  UIView *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  v4 = view;
  -[UIEditMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_hasVisibleMenu");

  if (v6)
  {
    -[UIContextMenuInteraction locationInView:](self->_contextMenuInteraction, "locationInView:", v4);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    -[UIEditMenuInteraction activeConfiguration](self, "activeConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[UIEditMenuInteraction activeConfiguration](self, "activeConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sourcePoint");
      v8 = v13;
      v10 = v14;

    }
    else
    {
      v8 = 1.79769313e308;
      v10 = 1.79769313e308;
    }
    if (v8 == 1.79769313e308 && v10 == 1.79769313e308)
    {
      -[UIEditMenuInteraction view](self, "view");
      v15 = (UIView *)objc_claimAutoreleasedReturnValue();

      if (v15 == v4)
      {
        v8 = 1.79769313e308;
        v10 = 1.79769313e308;
      }
      else
      {
        -[UIEditMenuInteraction view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "convertPoint:toView:", v4, v8, 1.79769313e308);
        v8 = v17;
        v10 = v18;

      }
    }
  }

  v19 = v8;
  v20 = v10;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)_dismissMenuWithPresentationType:(int64_t)a3
{
  void *v5;
  UIEditMenuConfiguration *pendingConfiguration;
  void *v7;
  void *v8;
  int v9;
  id v10;

  -[UIEditMenuInteraction pendingConfiguration](self, "pendingConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    pendingConfiguration = self->_pendingConfiguration;
    self->_pendingConfiguration = 0;

  }
  -[UIEditMenuInteraction activeEditMenuPresentation](self, "activeEditMenuPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 != 2 && v7)
  {
    -[UIEditMenuInteraction activeEditMenuPresentation](self, "activeEditMenuPresentation");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hideMenuWithReason:", 0);
LABEL_9:

    return;
  }
  -[UIEditMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_hasVisibleMenu");

  if (a3 != 1 && v9)
  {
    -[UIEditMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissMenu");
    goto LABEL_9;
  }
}

- (void)_updateVisibleMenuWithReason:(int64_t)a3 updateBlock:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void (**v14)(id, void *);

  v14 = (void (**)(id, void *))a4;
  -[UIEditMenuInteraction activeEditMenuPresentation](self, "activeEditMenuPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedMenu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "_mutableCopy");
    v14[2](v14, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if ((void *)v9 == v8)
    {

    }
    else
    {
      v10 = (void *)v9;
      +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
      -[UIEditMenuInteraction activeEditMenuPresentation](self, "activeEditMenuPresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "replaceVisibleMenuWithMenu:reason:", v10, a3);

    }
    goto LABEL_7;
  }
  -[UIEditMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_hasVisibleMenu");

  if (v13)
  {
    -[UIEditMenuInteraction contextMenuInteraction](self, "contextMenuInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateVisibleMenuWithBlock:", v14);
LABEL_7:

  }
}

- (BOOL)_dismissedByActionSelection
{
  return self->_dismissedByMenuAction;
}

- (BOOL)_dismissedRecently
{
  return CFAbsoluteTimeGetCurrent() < self->_lastDismissalTime + 0.6;
}

- (CGRect)menuFrameInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a3;
  -[UIEditMenuInteraction activeEditMenuPresentation](self, "activeEditMenuPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIEditMenuInteraction activeEditMenuPresentation](self, "activeEditMenuPresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "menuFrameInCoordinateSpace:", v4);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_proxySender
{
  void *WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(&self->__proxySender);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self;
  v5 = WeakRetained;

  return v5;
}

- (id)firstResponderTargetForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((*(_WORD *)&self->_delegateImplements & 0x80) == 0
    || (-[UIEditMenuInteraction delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "_editMenuInteraction:firstResponderTargetForConfiguration:", self, v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    objc_msgSend(v4, "_firstResponderTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[UIEditMenuInteraction view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

- (id)_defaultSuggestedActionsAtLocation:(CGPoint)a3 configuration:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  -[UIEditMenuInteraction firstResponderTargetForConfiguration:](self, "firstResponderTargetForConfiguration:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEditMenuInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIEditMenuProvider menuElementsFromResponderChain:atLocation:inCoordinateSpace:includeMenuControllerItems:](_UIEditMenuProvider, "menuElementsFromResponderChain:atLocation:inCoordinateSpace:includeMenuControllerItems:", v7, v8, -[UIEditMenuInteraction _includeMenuControllerItems](self, "_includeMenuControllerItems"), x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_editMenuPresentation:(id)a3 didSelectMenuLeaf:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_storeWeak((id *)&self->__selectedMenuLeaf, v9);
  -[UIEditMenuInteraction _proxySender](self, "_proxySender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v9;
    objc_msgSend(v8, "activeConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEditMenuInteraction firstResponderTargetForConfiguration:](self, "firstResponderTargetForConfiguration:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "set_useSenderForResolvingTarget:", -[UIEditMenuInteraction _useSenderAsResponderSender](self, "_useSenderAsResponderSender"));
    objc_msgSend(v12, "_resolvedTargetFromFirstTarget:sender:shouldUseFallbackActionOut:", v14, v11, &v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_10;
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "_performFallbackActionWithSender:target:", v11, v15);
        goto LABEL_8;
      }
    }
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v9, "performWithSender:target:", v11, v15);
LABEL_8:
  if ((*(_WORD *)&self->_delegateImplements & 0x100) != 0)
  {
    -[UIEditMenuInteraction delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_editMenuInteraction:didPerformMenuLeaf:target:", self, v9, v15);

  }
LABEL_10:
  self->_dismissedByMenuAction = (objc_msgSend(v9, "attributes") & 8) == 0;
  objc_storeWeak((id *)&self->__selectedMenuLeaf, 0);
  v10[2](v10);

}

- (CGRect)_editMenuPresentation:(id)a3 targetRectForConfiguration:(id)a4
{
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  v5 = a4;
  -[UIEditMenuInteraction _targetRectForConfiguration:](self, "_targetRectForConfiguration:", v5);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  if (CGRectIsNull(v16))
  {
    objc_msgSend(v5, "sourcePoint");
    x = v10;
    y = v11;
    width = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_editMenuPresentation:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  v9 = a4;
  -[UIEditMenuInteraction _outgoingPresentation](self, "_outgoingPresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forceEndDismissalIfNeeded");

  -[UIEditMenuInteraction _dismissMenuWithPresentationType:](self, "_dismissMenuWithPresentationType:", 2);
  -[UIEditMenuInteraction _willPresentMenuForConfiguration:animator:](self, "_willPresentMenuForConfiguration:animator:", v9, v7);

}

- (void)_editMenuPresentation:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  _UIEditMenuPresentation *v9;
  id v10;
  void *v11;
  _UIEditMenuPresentation *v12;
  _QWORD v13[5];
  _UIEditMenuPresentation *v14;

  v9 = (_UIEditMenuPresentation *)a3;
  v10 = a5;
  -[UIEditMenuInteraction _willDismissMenuForConfiguration:animator:](self, "_willDismissMenuForConfiguration:animator:", a4, v10);
  if (self->_activeEditMenuPresentation == v9)
  {
    self->_activeEditMenuPresentation = 0;

    -[UIEditMenuInteraction _outgoingPresentation](self, "_outgoingPresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "forceEndDismissalIfNeeded");

    objc_storeStrong((id *)&self->__outgoingPresentation, a3);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__UIEditMenuInteraction__editMenuPresentation_willDismissMenuForConfiguration_animator___block_invoke;
  v13[3] = &unk_1E16B1B50;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "addCompletion:", v13);

}

void __88__UIEditMenuInteraction__editMenuPresentation_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 88);
  if (v3 == v2)
  {
    *(_QWORD *)(v1 + 88) = 0;

  }
}

- (void)_editMenuPresentation:(id)a3 preparedMenuForDisplay:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  unsigned int v20;
  unsigned __int8 v21;

  v8 = a4;
  v9 = (void (**)(id, id))a5;
  objc_msgSend(a3, "activeConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEditMenuInteraction _menuPreparationContextForConfiguration:](self, "_menuPreparationContextForConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v8;
  v13 = v11;
  if ((objc_msgSend(v12, "metadata") & 1) != 0)
  {
    v18 = v12;
  }
  else
  {
    objc_msgSend(v13, "setTracksSelection:", (objc_msgSend(v12, "options") & 0x80) == 0);
    v21 = 0;
    v20 = 0;
    +[_UIActionBridge validatedCommandMenuForMenu:context:](_UIActionBridge, "validatedCommandMenuForMenu:context:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_resolvedElementSize");
    objc_msgSend(v14, "children");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _menuElementsPreparedForDisplay(v16, v15, v13, (uint64_t)&v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "menuByReplacingChildren:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(v20) = 1;
    if (objc_msgSend(v13, "supportsHeaderView"))
    {
      objc_msgSend(v12, "headerView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HIBYTE(v20) |= v19 != 0;

    }
    objc_msgSend(v18, "setMetadata:", v20 | ((unint64_t)v21 << 32));
  }

  v9[2](v9, v18);
}

- (void)_editMenuPresentation:(id)a3 didTransitionMenuForConfiguration:(id)a4
{
  id v5;
  id v6;

  if ((*(_WORD *)&self->_delegateImplements & 0x20) != 0)
  {
    v5 = a4;
    -[UIEditMenuInteraction delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_editMenuInteraction:didTransitionMenuForConfiguration:", self, v5);

  }
}

- (id)_editMenuPresentation:(id)a3 titleViewForMenu:(id)a4 configuration:(id)a5
{
  void *v5;
  id v8;
  id v9;
  void *v10;

  if ((*(_WORD *)&self->_delegateImplements & 0x40) != 0)
  {
    v8 = a5;
    v9 = a4;
    -[UIEditMenuInteraction delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_editMenuInteraction:titleViewForMenu:configuration:", self, v9, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_editMenuPresentation:(id)a3 preferredLayoutRectsForConfiguration:(id)a4
{
  void *v4;
  id v6;
  void *v7;

  if ((*(_WORD *)&self->_delegateImplements & 0x200) != 0)
  {
    v6 = a4;
    -[UIEditMenuInteraction delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_editMenuInteraction:preferredLayoutRectsForConfiguration:", self, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)_contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 completion:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  UIEditMenuConfiguration *v10;
  UIEditMenuConfiguration *activeConfiguration;
  UIEditMenuConfiguration *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", v9, x, y);
  v10 = (UIEditMenuConfiguration *)objc_claimAutoreleasedReturnValue();
  activeConfiguration = self->_activeConfiguration;
  self->_activeConfiguration = v10;

  v12 = self->_activeConfiguration;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__UIEditMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke;
  v14[3] = &unk_1E16CD258;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  -[UIEditMenuInteraction _prepareMenuAtLocation:configuration:completionHandler:](self, "_prepareMenuAtLocation:configuration:completionHandler:", v12, v14, x, y);

}

void __91__UIEditMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __91__UIEditMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2;
    v8[3] = &unk_1E16B5118;
    v9 = v3;
    +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", v6, 0, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __91__UIEditMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4.x, a4.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIEditMenuInteraction.m"), 649, CFSTR("This should never be called."));

  return 0;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5;
  UIPreviewTarget *v6;
  void *v7;
  UIPreviewTarget *v8;
  void *v9;
  UITargetedPreview *v10;
  void *v11;
  UITargetedPreview *v12;

  v5 = a3;
  v6 = [UIPreviewTarget alloc];
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIEditMenuConfiguration sourcePoint](self->_activeConfiguration, "sourcePoint");
  v8 = -[UIPreviewTarget initWithContainer:center:](v6, "initWithContainer:center:", v7);

  v9 = (void *)objc_opt_new();
  v10 = [UITargetedPreview alloc];
  v11 = (void *)objc_opt_new();
  v12 = -[UITargetedPreview initWithView:parameters:target:](v10, "initWithView:parameters:target:", v9, v11, v8);

  return v12;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = 0;
    v12 = v9;
  }
  else
  {
    v11 = (id)objc_opt_new();
    v12 = v11;
  }
  -[UIEditMenuInteraction _dismissMenuWithPresentationType:](self, "_dismissMenuWithPresentationType:", 1);
  -[UIEditMenuInteraction activeConfiguration](self, "activeConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEditMenuInteraction _willPresentMenuForConfiguration:animator:](self, "_willPresentMenuForConfiguration:animator:", v13, v12);

  if (v11)
  {
    objc_msgSend(v11, "runAnimations");
    objc_msgSend(v11, "runCompletions");
  }

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIEditMenuConfiguration *activeConfiguration;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = 0;
    v12 = v9;
  }
  else
  {
    v11 = (id)objc_opt_new();
    v12 = v11;
  }
  -[UIEditMenuInteraction activeConfiguration](self, "activeConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEditMenuInteraction _willDismissMenuForConfiguration:animator:](self, "_willDismissMenuForConfiguration:animator:", v13, v12);

  objc_msgSend(v8, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEditMenuConfiguration identifier](self->_activeConfiguration, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == v15)
  {
    activeConfiguration = self->_activeConfiguration;
    self->_activeConfiguration = 0;

    if (!v11)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    objc_msgSend(v11, "runAnimations");
    objc_msgSend(v11, "runCompletions");
  }
LABEL_7:

}

- (void)_setUseSenderAsResponderSender:(BOOL)a3
{
  self->__useSenderAsResponderSender = a3;
  -[UIContextMenuInteraction set_useSenderAsResponderSender:](self->_contextMenuInteraction, "set_useSenderAsResponderSender:");
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;

  +[_UIContextMenuStyle defaultStyle](_UIContextMenuStyle, "defaultStyle", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredLayout:", 3);
  objc_msgSend(v5, "setKeepsInputViewsVisible:", 1);
  -[UIEditMenuInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_parentTraitEnvironmentForUserInterfaceStyle:", v6);

  return v5;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)_anchorForPreferredArrowDirection:(SEL)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  switch(a4)
  {
    case 0:
    case 2:
      -[$9638EFF0CCCAFE90921E224CC361F7AC view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "_shouldReverseLayoutDirection"))
        v6 = 8;
      else
        v6 = 2;

      goto LABEL_7;
    case 1:
      -[$9638EFF0CCCAFE90921E224CC361F7AC view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "_shouldReverseLayoutDirection"))
        v6 = 8;
      else
        v6 = 2;

      v7 = 4;
      break;
    case 3:
      v6 = 1;
      v7 = 8;
      break;
    case 4:
      v6 = 1;
      v7 = 2;
      break;
    default:
      v6 = 0;
LABEL_7:
      v7 = 1;
      break;
  }
  retstr->var0 = v7;
  retstr->var1 = v6;
  retstr->var3 = 0.0;
  retstr->var4 = 0;
  retstr->var2 = 0.0;
  return self;
}

- (id)_menuPreparationContextForConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UIEditMenuInteraction firstResponderTargetForConfiguration:](self, "firstResponderTargetForConfiguration:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIMenuPreparationContext contextWithPreparer:firstResponderTarget:](_UIMenuPreparationContext, "contextWithPreparer:firstResponderTarget:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeferredElementDelegate:", self);
  objc_msgSend(v5, "setSupportsCustomViewMenuElements:", 0);
  -[UIEditMenuInteraction _proxySender](self, "_proxySender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSender:", v6);

  objc_msgSend(v5, "setUseSenderAsResponderSender:", -[UIEditMenuInteraction _useSenderAsResponderSender](self, "_useSenderAsResponderSender"));
  return v5;
}

- (void)_prepareMenuAtLocation:(CGPoint)a3 configuration:(id)a4 completionHandler:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void (**v14)(void *, void *);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  -[UIEditMenuInteraction _defaultSuggestedActionsAtLocation:configuration:](self, "_defaultSuggestedActionsAtLocation:configuration:", v9, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __80__UIEditMenuInteraction__prepareMenuAtLocation_configuration_completionHandler___block_invoke;
  v19 = &unk_1E16CD258;
  v12 = v11;
  v20 = v12;
  v21 = v10;
  v13 = v10;
  v14 = (void (**)(void *, void *))_Block_copy(&v16);
  if ((*(_WORD *)&self->_delegateImplements & 0x10) != 0)
  {
    -[UIEditMenuInteraction delegate](self, "delegate", v16, v17, v18, v19, v20, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_editMenuInteraction:menuForConfiguration:suggestedActions:completionHandler:", self, v9, v12, v14);
  }
  else
  {
    -[UIEditMenuInteraction _menuForSuggestedActions:configuration:](self, "_menuForSuggestedActions:configuration:", v12, v9, v16, v17, v18, v19, v20, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v15);
  }

}

void __80__UIEditMenuInteraction__prepareMenuAtLocation_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (!v3)
  {
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", *(_QWORD *)(a1 + 32));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)deferredMenuElementWasFulfilled:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__UIEditMenuInteraction_deferredMenuElementWasFulfilled___block_invoke;
  v6[3] = &unk_1E16B50F0;
  v7 = v4;
  v5 = v4;
  -[UIEditMenuInteraction _updateVisibleMenuWithReason:updateBlock:](self, "_updateVisibleMenuWithReason:updateBlock:", 2, v6);

}

id __57__UIEditMenuInteraction_deferredMenuElementWasFulfilled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (isDeferredElementVisibleInMenu(*(void **)(a1 + 32), v3))
    v4 = (id)objc_msgSend(v3, "copy");
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (id)_menuForSuggestedActions:(id)a3 configuration:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;

  if ((*(_WORD *)&self->_delegateImplements & 1) != 0)
  {
    v7 = a4;
    v8 = a3;
    -[UIEditMenuInteraction delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "editMenuInteraction:menuForConfiguration:suggestedActions:", self, v7, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (CGRect)_targetRectForConfiguration:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  if ((*(_WORD *)&self->_delegateImplements & 2) != 0)
  {
    v8 = a3;
    -[UIEditMenuInteraction delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "editMenuInteraction:targetRectForConfiguration:", self, v8);
    v3 = v10;
    v4 = v11;
    v5 = v12;
    v6 = v13;

  }
  else
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_willPresentMenuForConfiguration:(id)a3 animator:(id)a4
{
  id v6;
  id v7;
  id v8;

  self->_lastDismissalTime = 0.0;
  self->_dismissedByMenuAction = 0;
  if ((*(_BYTE *)&self->_delegateImplements & 4) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[UIEditMenuInteraction delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "editMenuInteraction:willPresentMenuForConfiguration:animator:", self, v7, v6);

  }
}

- (void)_willDismissMenuForConfiguration:(id)a3 animator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  self->_lastDismissalTime = CFAbsoluteTimeGetCurrent();
  if ((*(_BYTE *)&self->_delegateImplements & 8) != 0)
  {
    -[UIEditMenuInteraction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "editMenuInteraction:willDismissMenuForConfiguration:animator:", self, v6, v7);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__UIEditMenuInteraction__willDismissMenuForConfiguration_animator___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "addCompletion:", v10);

}

void __67__UIEditMenuInteraction__willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "activeConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 32), "setActiveConfiguration:", 0);
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIEditMenuConfiguration)pendingConfiguration
{
  return self->_pendingConfiguration;
}

- (void)setPendingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_pendingConfiguration, a3);
}

- (UIEditMenuConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setActiveConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_activeConfiguration, a3);
}

- (_UIEditMenuPresentation)_outgoingPresentation
{
  return self->__outgoingPresentation;
}

- (BOOL)_includeMenuControllerItems
{
  return self->__includeMenuControllerItems;
}

- (void)setDisplayingMenu:(BOOL)a3
{
  self->_displayingMenu = a3;
}

- (UIMenuLeaf)_selectedMenuLeaf
{
  return (UIMenuLeaf *)objc_loadWeakRetained((id *)&self->__selectedMenuLeaf);
}

- (void)set_selectedMenuLeaf:(id)a3
{
  objc_storeWeak((id *)&self->__selectedMenuLeaf, a3);
}

- (BOOL)_useSenderAsResponderSender
{
  return self->__useSenderAsResponderSender;
}

- (BOOL)_enforcesMenuControllerLifecycle
{
  return self->__enforcesMenuControllerLifecycle;
}

- (void)_setEnforcesMenuControllerLifecycle:(BOOL)a3
{
  self->__enforcesMenuControllerLifecycle = a3;
}

@end
