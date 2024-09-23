@implementation SKUINavigationControllerAssistant

- (id)_initWithNavigationController:(id)a3 clientContext:(id)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKUINavigationControllerAssistant *v15;
  SKUINavigationControllerAssistant *v16;
  id v17;
  id WeakRetained;
  uint64_t v19;
  _UINavigationControllerPalette *paletteBackgroundView;
  id v21;
  uint64_t v22;
  _UINavigationControllerPalette *v23;
  void *v24;
  objc_super v26;
  id location;

  objc_initWeak(&location, a3);
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        -[SKUINavigationControllerAssistant _initWithNavigationController:clientContext:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUINavigationControllerAssistant;
  v15 = -[SKUINavigationControllerAssistant init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_clientContext, a4);
    v17 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v16->_navigationController, v17);

    WeakRetained = objc_loadWeakRetained((id *)&v16->_navigationController);
    objc_msgSend(WeakRetained, "existingPaletteForEdge:", 2);
    v19 = objc_claimAutoreleasedReturnValue();
    paletteBackgroundView = v16->_paletteBackgroundView;
    v16->_paletteBackgroundView = (_UINavigationControllerPalette *)v19;

    if (!v16->_paletteBackgroundView)
    {
      v21 = objc_loadWeakRetained((id *)&v16->_navigationController);
      objc_msgSend(v21, "paletteForEdge:size:", 2, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v16->_paletteBackgroundView;
      v16->_paletteBackgroundView = (_UINavigationControllerPalette *)v22;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v16, sel__previewDocumentChangeNotification_, CFSTR("SKUIApplicationControllerPreviewOverlayDidChangeNotification"), 0);

  }
  objc_destroyWeak(&location);
  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SKUIApplicationControllerPreviewOverlayDidChangeNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E73B28D0, 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUINavigationControllerAssistant;
  -[SKUINavigationControllerAssistant dealloc](&v4, sel_dealloc);
}

+ (id)assistantForNavigationController:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        +[SKUINavigationControllerAssistant assistantForNavigationController:clientContext:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "_outermostNavigationController");
    v15 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v15;
  }
  objc_getAssociatedObject(v5, "com.apple.StoreKitUI.SKUINavigationControllerAssistant");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v16 = -[SKUINavigationControllerAssistant _initWithNavigationController:clientContext:]([SKUINavigationControllerAssistant alloc], "_initWithNavigationController:clientContext:", v5, v6);
    objc_setAssociatedObject(v5, "com.apple.StoreKitUI.SKUINavigationControllerAssistant", v16, (void *)1);
  }

  return v16;
}

+ (id)existingAssistantForNavigationController:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    +[SKUINavigationControllerAssistant existingAssistantForNavigationController:].cold.1();
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_outermostNavigationController");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  objc_getAssociatedObject(v3, "com.apple.StoreKitUI.SKUINavigationControllerAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setHidesShadow:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  if (self->_hidesShadow != a3)
  {
    v3 = a3;
    self->_hidesShadow = a3;
    -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "SKUI_beginHidingPaletteShadow");
    else
      objc_msgSend(v4, "SKUI_endHidingPaletteShadow");

  }
}

- (void)setPalettePinningBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setPalettePinningBarHidden:", v3);

  }
}

- (void)setPaletteView:(id)a3 animated:(BOOL)a4
{
  -[SKUINavigationControllerAssistant _transitionToPaletteView:animated:operation:](self, "_transitionToPaletteView:animated:operation:", a3, a4, 0);
}

- (void)setStatusOverlayProvider:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5 = a3;
  -[SKUINavigationControllerAssistant setStatusOverlayProvider:animated:](self, "setStatusOverlayProvider:animated:", v5, objc_msgSend(v4, "_isInAnimationBlock"));

}

- (void)willShowViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a4;
  v6 = a3;
  -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF479098))
  {
    objc_msgSend(v6, "navigationPaletteView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = 0;
  if (v4)
  {
LABEL_5:
    objc_msgSend(v6, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v11 != v6;

  }
LABEL_6:
  -[SKUINavigationControllerAssistant navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUINavigationControllerAssistant _transitionToPaletteView:animated:operation:](self, "_transitionToPaletteView:animated:operation:", v8, v4, objc_msgSend(v12, "lastOperation"));

  -[SKUINavigationControllerAssistant navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transitionCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__SKUINavigationControllerAssistant_willShowViewController_animated___block_invoke;
  v17[3] = &unk_1E73A35C8;
  v17[4] = self;
  v18 = v7;
  v16 = v7;
  objc_msgSend(v15, "notifyWhenInteractionEndsUsingBlock:", v17);

}

void __69__SKUINavigationControllerAssistant_willShowViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(a2, "isCancelled"))
  {
    v4 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_transitionToPaletteView:animated:operation:", v3, 0, objc_msgSend(v5, "lastOperation"));

  }
}

- (_UINavigationControllerPalette)paletteBackgroundView
{
  void *v3;

  if ((-[_UINavigationControllerPalette isAttached](self->_paletteBackgroundView, "isAttached") & 1) == 0)
  {
    -[SKUINavigationControllerAssistant navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attachPalette:isPinned:", self->_paletteBackgroundView, 1);

  }
  return self->_paletteBackgroundView;
}

- (void)_previewDocumentChangeNotification:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t IsVisible;
  id v11;

  v11 = a3;
  -[SKUINavigationControllerAssistant statusOverlayProvider](self, "statusOverlayProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_previewOverlayDocumentController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isPreviewActive") & 1) == 0)
    {

      v8 = 0;
    }
    -[SKUINavigationControllerAssistant navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IsVisible = SKUIViewControllerIsVisible(v9);

    -[SKUINavigationControllerAssistant _setStatusOverlayProvider:animated:](self, "_setStatusOverlayProvider:animated:", v8, IsVisible);
    v6 = v11;
  }

}

- (void)_hideChildPaletteView:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  SKUINavigationControllerAssistant *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;

  v6 = a3;
  -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SKUINavigationControllerAssistant statusOverlayViewController](self, "statusOverlayViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;
    v20 = v18;
  }
  else
  {
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v20 = 0.0;
  }
  v22 = *MEMORY[0x1E0C9D538];
  v21 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
  if (a4)
  {
    v23 = (void *)MEMORY[0x1E0DC3F10];
    v24 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __68__SKUINavigationControllerAssistant__hideChildPaletteView_animated___block_invoke;
    v29[3] = &unk_1E73A8EB0;
    v30 = v6;
    v33 = v22;
    v34 = v21;
    v35 = v17;
    v36 = v19;
    v31 = v15;
    v32 = self;
    v37 = v9;
    v38 = v11;
    v39 = v13;
    v40 = v20;
    v27[0] = v24;
    v27[1] = 3221225472;
    v27[2] = __68__SKUINavigationControllerAssistant__hideChildPaletteView_animated___block_invoke_2;
    v27[3] = &unk_1E73A71A8;
    v27[4] = self;
    v28 = v30;
    objc_msgSend(v23, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v29, v27, 0.35, 0.0, 0.7, 0.0);

  }
  else
  {
    objc_msgSend(v15, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v17, v19);
    -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:isAnimating:", objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"), v9, v11, v13, v20);

    -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPinningBarShadowIsHidden:", objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"));

    objc_msgSend(v6, "removeFromSuperview");
  }

}

void __68__SKUINavigationControllerAssistant__hideChildPaletteView_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 48), "paletteBackgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:isAnimating:", 1, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));

}

uint64_t __68__SKUINavigationControllerAssistant__hideChildPaletteView_animated___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "paletteBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPinningBarShadowIsHidden:", 0);

  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

- (void)_hideOverlayView:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  SKUINavigationControllerAssistant *v34;
  double v35;
  double v36;
  double v37;
  double v38;

  v6 = a3;
  -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;

  }
  else
  {
    v17 = 0.0;
  }
  if (a4)
  {
    -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v6, "frame");
      v18 = (void *)objc_msgSend(v19, "initWithFrame:");
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setBackgroundColor:", v20);

      objc_msgSend(v18, "setClipsToBounds:", 1);
      objc_msgSend(v6, "superview");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "insertSubview:belowSubview:", v18, v22);

      objc_msgSend(v18, "bounds");
      objc_msgSend(v6, "setFrame:");
      objc_msgSend(v18, "addSubview:", v6);
    }
    v23 = (void *)MEMORY[0x1E0DC3F10];
    v24 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __63__SKUINavigationControllerAssistant__hideOverlayView_animated___block_invoke;
    v32[3] = &unk_1E73A6188;
    v33 = v6;
    v34 = self;
    v35 = v9;
    v36 = v11;
    v37 = v13;
    v38 = v17;
    v29[0] = v24;
    v29[1] = 3221225472;
    v29[2] = __63__SKUINavigationControllerAssistant__hideOverlayView_animated___block_invoke_2;
    v29[3] = &unk_1E73A33D0;
    v29[4] = self;
    v30 = v33;
    v31 = v18;
    v25 = v18;
    objc_msgSend(v23, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v32, v29, 0.35, 0.0, 0.7, 0.0);

  }
  else
  {
    -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:isAnimating:", 0, v9, v11, v13, v17);

    -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPinningBarShadowIsHidden:", v28 != 0);

    objc_msgSend(v6, "removeFromSuperview");
  }

}

void __63__SKUINavigationControllerAssistant__hideOverlayView_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  objc_msgSend(*(id *)(a1 + 40), "paletteBackgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:isAnimating:", 1, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

uint64_t __63__SKUINavigationControllerAssistant__hideOverlayView_animated___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(a1[4], "paletteBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "childPaletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPinningBarShadowIsHidden:", v3 != 0);

  objc_msgSend(a1[5], "removeFromSuperview");
  return objc_msgSend(a1[6], "removeFromSuperview");
}

- (void)_setStatusOverlayProvider:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SKUIStatusOverlayProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  SKUIStatusOverlayProvider *v16;

  v4 = a4;
  v7 = (SKUIStatusOverlayProvider *)a3;
  if (self->_statusOverlayProvider != v7)
  {
    v16 = v7;
    -[SKUINavigationControllerAssistant statusOverlayViewController](self, "statusOverlayViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_statusOverlayProvider, a3);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "userInterfaceStyle");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SKUIStatusOverlayProvider overlayViewControllerWithBackgroundStyle:](self->_statusOverlayProvider, "overlayViewControllerWithBackgroundStyle:", v12 != 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUINavigationControllerAssistant setStatusOverlayViewController:](self, "setStatusOverlayViewController:", v13);

    }
    else
    {
      -[SKUINavigationControllerAssistant setStatusOverlayViewController:](self, "setStatusOverlayViewController:", 0);
    }
    -[SKUINavigationControllerAssistant statusOverlayViewController](self, "statusOverlayViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[SKUINavigationControllerAssistant _showOverlayView:previousOverlayView:animated:](self, "_showOverlayView:previousOverlayView:animated:", v15, v9, v4);
    }
    else if (v9)
    {
      -[SKUINavigationControllerAssistant _hideOverlayView:animated:](self, "_hideOverlayView:animated:", v9, v4);
    }

    v7 = v16;
  }

}

- (void)_showOverlayView:(id)a3 previousOverlayView:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  double *v42;
  uint64_t v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  SKUINavigationControllerAssistant *v53;
  uint64_t *v54;
  _QWORD v55[4];
  id v56;
  SKUINavigationControllerAssistant *v57;
  uint64_t *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  CGRect v69;

  v8 = a3;
  v9 = a4;
  v63 = 0;
  v64 = &v63;
  v65 = 0x4010000000;
  v66 = &unk_1BBF15257;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v8, "frame");
  *(_QWORD *)&v67 = v10;
  *((_QWORD *)&v67 + 1) = v11;
  *(_QWORD *)&v68 = v12;
  *((_QWORD *)&v68 + 1) = v13;
  *((_OWORD *)v64 + 2) = *MEMORY[0x1E0C9D538];
  -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v64[6] = v15;

  -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = *((double *)v64 + 7);
  -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;

    v69.origin.x = v27;
    v69.origin.y = v29;
    v69.size.width = v31;
    v69.size.height = v33;
    *((CGFloat *)v64 + 5) = CGRectGetMaxY(v69);
    v23 = v23 + v33;
  }
  objc_msgSend(v8, "setAutoresizingMask:", 2);
  objc_msgSend(v8, "setFrame:", *((double *)v64 + 4), *((double *)v64 + 5), *((double *)v64 + 6), *((double *)v64 + 7));
  objc_msgSend(v8, "layoutIfNeeded");
  -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSubview:", v8);

  -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPinningBarShadowIsHidden:", v36 != 0);

  objc_msgSend(v9, "removeFromSuperview");
  if (a5)
  {
    -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v37 = (void *)objc_msgSend(v38, "initWithFrame:", *((double *)v64 + 4), *((double *)v64 + 5), *((double *)v64 + 6), *((double *)v64 + 7));
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setBackgroundColor:", v39);

      objc_msgSend(v37, "setClipsToBounds:", 1);
      objc_msgSend(v8, "superview");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "insertSubview:belowSubview:", v37, v41);

      objc_msgSend(v37, "bounds");
      objc_msgSend(v8, "setFrame:");
      objc_msgSend(v37, "addSubview:", v8);
    }
    objc_msgSend(v8, "frame");
    v42 = (double *)v64;
    v64[6] = v43;
    v42[7] = v44;
    *((_QWORD *)v42 + 4) = v46;
    v42[5] = v45 - v44;
    objc_msgSend(v8, "setFrame:");
    v47 = (void *)MEMORY[0x1E0DC3F10];
    v48 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __83__SKUINavigationControllerAssistant__showOverlayView_previousOverlayView_animated___block_invoke;
    v55[3] = &unk_1E73A8ED8;
    v58 = &v63;
    v56 = v8;
    v57 = self;
    v59 = v18;
    v60 = v20;
    v61 = v22;
    v62 = v23;
    v50[0] = v48;
    v50[1] = 3221225472;
    v50[2] = __83__SKUINavigationControllerAssistant__showOverlayView_previousOverlayView_animated___block_invoke_2;
    v50[3] = &unk_1E73A8F00;
    v49 = v37;
    v51 = v49;
    v52 = v56;
    v53 = self;
    v54 = &v63;
    objc_msgSend(v47, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v55, v50, 0.35, 0.0, 0.7, 0.0);

  }
  else
  {
    -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
    v49 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setFrame:isAnimating:", 0, v18, v20, v22, v23);
  }

  _Block_object_dispose(&v63, 8);
}

void __83__SKUINavigationControllerAssistant__showOverlayView_previousOverlayView_animated___block_invoke(uint64_t a1)
{
  id v2;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 56)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 40);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
  objc_msgSend(*(id *)(a1 + 40), "paletteBackgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:isAnimating:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

uint64_t __83__SKUINavigationControllerAssistant__showOverlayView_previousOverlayView_animated___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    v2 = *(void **)(result + 40);
    objc_msgSend(*(id *)(result + 48), "paletteBackgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:fromView:", *(_QWORD *)(v1 + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 56));
    objc_msgSend(v2, "setFrame:");

    objc_msgSend(*(id *)(v1 + 48), "paletteBackgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", *(_QWORD *)(v1 + 40));

    return objc_msgSend(*(id *)(v1 + 32), "removeFromSuperview");
  }
  return result;
}

- (void)_transitionToPaletteView:(id)a3 animated:(BOOL)a4 operation:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double *v27;
  double MaxX;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double MaxY;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double y;
  double x;
  double height;
  double width;
  _QWORD v57[4];
  id v58;
  _QWORD v59[5];
  id v60;
  id v61;
  uint64_t *v62;
  int64_t v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  double *v77;
  uint64_t v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  CGRect v82;
  CGRect v83;

  v6 = a4;
  v8 = a3;
  -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 != v8)
  {
    -[SKUINavigationControllerAssistant setChildPaletteView:](self, "setChildPaletteView:", v8);
    -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      v76 = 0;
      v77 = (double *)&v76;
      v78 = 0x4010000000;
      v79 = &unk_1BBF15257;
      v80 = 0u;
      v81 = 0u;
      -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "frame");
      *(_QWORD *)&v80 = v23;
      *((_QWORD *)&v80 + 1) = v24;
      *(_QWORD *)&v81 = v25;
      *((_QWORD *)&v81 + 1) = v26;

      v27 = v77;
      v77[4] = 0.0;
      v27[5] = v21 - v27[7];
      v27[6] = v19;
      if (!v11)
        goto LABEL_12;
      if (a5 == 2)
      {
        MaxX = -v19;
      }
      else
      {
        if (a5 != 1)
          goto LABEL_12;
        v82.origin.x = v15;
        v82.origin.y = v17;
        v82.size.width = v19;
        v82.size.height = v21;
        MaxX = CGRectGetMaxX(v82);
        v27 = v77;
      }
      v27[4] = MaxX;
LABEL_12:
      -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAutoresizingMask:", 2);

      -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFrame:", v77[4], v77[5], v77[6], v77[7]);

      -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layoutIfNeeded");

      -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSubview:", v33);

      -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setPinningBarShadowIsHidden:", 1);

      -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "frame");
      v37 = v36;
      v39 = v38;
      v41 = v40;

      -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "bounds");
      MaxY = v43;

      -[SKUINavigationControllerAssistant statusOverlayViewController](self, "statusOverlayViewController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "view");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        objc_msgSend(v46, "frame");
        v83.origin.y = v77[7];
        y = v83.origin.y;
        x = v83.origin.x;
        height = v83.size.height;
        width = v83.size.width;
        MaxY = CGRectGetMaxY(v83);
        if (v6)
        {
LABEL_14:
          v47 = (void *)MEMORY[0x1E0DC3F10];
          v48 = MEMORY[0x1E0C809B0];
          v59[0] = MEMORY[0x1E0C809B0];
          v59[1] = 3221225472;
          v59[2] = __81__SKUINavigationControllerAssistant__transitionToPaletteView_animated_operation___block_invoke;
          v59[3] = &unk_1E73A8F28;
          v62 = &v76;
          v59[4] = self;
          v60 = v11;
          v63 = a5;
          v64 = v15;
          v65 = v17;
          v66 = v19;
          v67 = v21;
          v68 = v37;
          v69 = v39;
          v70 = v41;
          v71 = MaxY;
          v61 = v46;
          v72 = x;
          v73 = y;
          v74 = width;
          v75 = height;
          v57[0] = v48;
          v57[1] = 3221225472;
          v57[2] = __81__SKUINavigationControllerAssistant__transitionToPaletteView_animated_operation___block_invoke_2;
          v57[3] = &unk_1E73A0108;
          v58 = v60;
          objc_msgSend(v47, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v59, v57, 0.35, 0.0, 0.7, 0.0);

LABEL_17:
          _Block_object_dispose(&v76, 8);
          goto LABEL_18;
        }
      }
      else
      {
        y = *(double *)(MEMORY[0x1E0C9D648] + 8);
        x = *MEMORY[0x1E0C9D648];
        height = *(double *)(MEMORY[0x1E0C9D648] + 24);
        width = *(double *)(MEMORY[0x1E0C9D648] + 16);
        if (v6)
          goto LABEL_14;
      }
      *((_OWORD *)v77 + 2) = *MEMORY[0x1E0C9D538];
      -[SKUINavigationControllerAssistant childPaletteView](self, "childPaletteView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setFrame:", v77[4], v77[5], v77[6], v77[7]);

      objc_msgSend(v46, "setFrame:", x, y, width, height);
      -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setFrame:isAnimating:", objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"), v37, v39, v41, MaxY);

      objc_msgSend(v11, "removeFromSuperview");
      -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setHidden:", 0);

      -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setAlpha:", 1.0);

      goto LABEL_17;
    }
    -[SKUINavigationControllerAssistant _hideChildPaletteView:animated:](self, "_hideChildPaletteView:animated:", v11, v6);
LABEL_18:

    goto LABEL_19;
  }

  if (v11)
  {
    -[SKUINavigationControllerAssistant paletteBackgroundView](self, "paletteBackgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resetBackgroundConstraints");
    goto LABEL_18;
  }
LABEL_19:

}

void __81__SKUINavigationControllerAssistant__transitionToPaletteView_animated_operation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double MaxX;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;

  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = *MEMORY[0x1E0C9D538];
  objc_msgSend(*(id *)(a1 + 32), "childPaletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));

  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v3, "frame");
    v6 = v5;
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 64);
    if (v9 == 2)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 72));
    }
    else if (v9 == 1)
    {
      MaxX = MaxX - v5;
    }
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", MaxX, *(double *)(a1 + 128) - v8, v6, v8);
  }
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
  objc_msgSend(*(id *)(a1 + 32), "paletteBackgroundView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:isAnimating:", objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));

}

uint64_t __81__SKUINavigationControllerAssistant__transitionToPaletteView_animated_operation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (BOOL)hidesShadow
{
  return self->_hidesShadow;
}

- (SKUIStatusOverlayProvider)statusOverlayProvider
{
  return self->_statusOverlayProvider;
}

- (UIView)childPaletteView
{
  return self->_childPaletteView;
}

- (void)setChildPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_childPaletteView, a3);
}

- (void)setPaletteBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_paletteBackgroundView, a3);
}

- (UIViewController)statusOverlayViewController
{
  return self->_statusOverlayViewController;
}

- (void)setStatusOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_statusOverlayViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusOverlayViewController, 0);
  objc_storeStrong((id *)&self->_paletteBackgroundView, 0);
  objc_storeStrong((id *)&self->_childPaletteView, 0);
  objc_storeStrong((id *)&self->_statusOverlayProvider, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_navigationController);
}

- (void)_initWithNavigationController:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)assistantForNavigationController:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)existingAssistantForNavigationController:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUINavigationControllerAssistant existingAssistantForNavigationController:]";
  OUTLINED_FUNCTION_1();
}

@end
