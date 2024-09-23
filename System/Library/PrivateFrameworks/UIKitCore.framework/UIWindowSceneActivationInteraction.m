@implementation UIWindowSceneActivationInteraction

- (UIWindowSceneActivationInteraction)initWithConfigurationProvider:(UIWindowSceneActivationInteractionConfigurationProvider)configurationProvider errorHandler:(void *)errorHandler
{
  UIWindowSceneActivationInteractionConfigurationProvider v6;
  void *v7;
  UIWindowSceneActivationInteraction *v8;
  UIWindowSceneActivationInteraction *v9;
  objc_super v11;

  v6 = configurationProvider;
  v7 = errorHandler;
  v11.receiver = self;
  v11.super_class = (Class)UIWindowSceneActivationInteraction;
  v8 = -[UIWindowSceneActivationInteraction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UIWindowSceneActivationInteraction setConfigurationProvider:](v8, "setConfigurationProvider:", v6);
    -[UIWindowSceneActivationInteraction setErrorHandler:](v9, "setErrorHandler:", v7);
  }

  return v9;
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;

  -[UIWindowSceneActivationInteraction pinchGR](self, "pinchGR", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowSceneActivationInteraction pinchGR](self, "pinchGR");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", v6);

  -[UIWindowSceneActivationInteraction doubleTapInteraction](self, "doubleTapInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    -[UIWindowSceneActivationInteraction doubleTapInteraction](self, "doubleTapInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "removeInteraction:", v9);

  }
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  UIPinchGestureRecognizer *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v4 = a3;
  objc_storeWeak((id *)&self->_view, v4);
  if (objc_msgSend((id)UIApp, "supportsMultipleScenes"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);

    if (WeakRetained)
    {
      -[UIWindowSceneActivationInteraction pinchGR](self, "pinchGR");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = -[UIGestureRecognizer initWithTarget:action:]([UIPinchGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePinchGesture_);
        -[UIWindowSceneActivationInteraction setPinchGR:](self, "setPinchGR:", v7);

        -[UIWindowSceneActivationInteraction pinchGR](self, "pinchGR");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setName:", CFSTR("com.apple.UIKit.UIWindowSceneActivationInteraction.pinch"));

        -[UIWindowSceneActivationInteraction pinchGR](self, "pinchGR");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setDelegate:", self);

      }
      v10 = objc_loadWeakRetained((id *)&self->_view);
      -[UIWindowSceneActivationInteraction pinchGR](self, "pinchGR");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addGestureRecognizer:", v11);

      -[UIWindowSceneActivationInteraction doubleTapInteraction](self, "doubleTapInteraction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v13 = (void *)objc_opt_new();
        -[UIWindowSceneActivationInteraction setDoubleTapInteraction:](self, "setDoubleTapInteraction:", v13);

        objc_initWeak(&location, self);
        v14 = MEMORY[0x1E0C809B0];
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke;
        v24[3] = &unk_1E16E2F28;
        objc_copyWeak(&v25, &location);
        -[UIWindowSceneActivationInteraction doubleTapInteraction](self, "doubleTapInteraction");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setShouldContinueProcessingSecondTap:", v24);

        v22[0] = v14;
        v22[1] = 3221225472;
        v22[2] = __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke_2;
        v22[3] = &unk_1E16E2F50;
        objc_copyWeak(&v23, &location);
        -[UIWindowSceneActivationInteraction doubleTapInteraction](self, "doubleTapInteraction");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setDidDoubleTap:", v22);

        objc_copyWeak(&v21, &location);
        -[UIWindowSceneActivationInteraction doubleTapInteraction](self, "doubleTapInteraction", v14, 3221225472, __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke_4, &unk_1E16B3F40);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setDidTimeOut:", &v20);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }
      v18 = objc_loadWeakRetained((id *)&self->_view);
      -[UIWindowSceneActivationInteraction doubleTapInteraction](self, "doubleTapInteraction");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addInteraction:", v19);

    }
  }

}

BOOL __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained;
  void *v6;
  _BOOL8 v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_requestConfigurationForLocation:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

void __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke_2(uint64_t a1, double a2, double a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_viewControllerForAncestor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke_3;
      v10[3] = &unk_1E16B1B28;
      v10[4] = v6;
      objc_msgSend(v6, "_prepareEffectForActiveConfigurationAtLocation:completion:", v10, a2, a3);
    }
  }

}

uint64_t __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endEffectWithVelocity:forActiveConfigurationWithCompletionStatus:", 1, 0.0);
}

void __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setActiveConfiguration:", 0);

}

- (BOOL)_supportsAssociation
{
  return 1;
}

- (id)_targetedPreviewForContinuingEffectWithPreview:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[_UIWindowSceneActivationEffectDescriptor descriptorWithPreview:](_UIWindowSceneActivationEffectDescriptor, "descriptorWithPreview:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIContentEffectManager sharedManager](_UIContentEffectManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compatibleEffectForDescriptor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "previewForContinuingToEffectWithPreview:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_handlePinchGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "state") == 1)
  {
    -[UIWindowSceneActivationInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    v9 = -[UIWindowSceneActivationInteraction _requestConfigurationForLocation:](self, "_requestConfigurationForLocation:", v6, v8);
    -[UIWindowSceneActivationInteraction _prepareEffectForActiveConfigurationAtLocation:completion:](self, "_prepareEffectForActiveConfigurationAtLocation:completion:", 0, v6, v8);
  }
  else if (objc_msgSend(v12, "state") == 2)
  {
    -[UIWindowSceneActivationInteraction activeEffect](self, "activeEffect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    objc_msgSend(v10, "advanceToScale:");

  }
  else if (objc_msgSend(v12, "state") >= 3)
  {
    v11 = -[UIWindowSceneActivationInteraction _shouldActivateForEndingPinch:](self, "_shouldActivateForEndingPinch:", v12);
    objc_msgSend(v12, "velocity");
    -[UIWindowSceneActivationInteraction _endEffectWithVelocity:forActiveConfigurationWithCompletionStatus:](self, "_endEffectWithVelocity:forActiveConfigurationWithCompletionStatus:", v11);
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "name", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.UIKit.multi-select"));

  return v5;
}

- (BOOL)_shouldActivateForEndingPinch:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;

  v3 = a3;
  +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinchEndingProjectionDuration");
  v6 = v5;

  +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pinchActivationScaleThreshold");
  v9 = v8;

  objc_msgSend(v3, "scale");
  v11 = v10;
  objc_msgSend(v3, "velocity");
  v13 = v11 + v6 * v12;
  v14 = objc_msgSend(v3, "state");

  return v13 > v9 && v14 == 3;
}

- (void)_cancelInteraction
{
  void *v3;
  id v4;

  -[UIWindowSceneActivationInteraction pinchGR](self, "pinchGR");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[UIWindowSceneActivationInteraction pinchGR](self, "pinchGR");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

}

- (void)_prewarmAnimationWithCompletion:(id)a3
{
  id v4;
  _UIWindowSceneActivationAnimator *v5;
  void *v6;
  _UIWindowSceneActivationAnimator *v7;
  id v8;
  _UIWindowSceneActivationAnimator *v9;
  _QWORD v10[5];
  _UIWindowSceneActivationAnimator *v11;
  id v12;

  v4 = a3;
  v5 = [_UIWindowSceneActivationAnimator alloc];
  -[UIWindowSceneActivationInteraction activeConfiguration](self, "activeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIWindowSceneActivationAnimator initWithConfiguration:](v5, "initWithConfiguration:", v6);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__UIWindowSceneActivationInteraction__prewarmAnimationWithCompletion___block_invoke;
  v10[3] = &unk_1E16E2F78;
  v10[4] = self;
  v11 = v7;
  v12 = v4;
  v8 = v4;
  v9 = v7;
  -[_UIWindowSceneActivationAnimator prewarmWithCompletion:](v9, "prewarmWithCompletion:", v10);
  -[UIWindowSceneActivationInteraction setAnimator:](self, "setAnimator:", v9);

}

void __70__UIWindowSceneActivationInteraction__prewarmAnimationWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = a3;
    objc_msgSend(v4, "activeEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "platterContainer");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    objc_msgSend(v7, "convertPoint:toView:", v5);
    objc_msgSend(v9, "setCenter:");

    objc_msgSend(v5, "addSubview:", v9);
    objc_msgSend(*(id *)(a1 + 40), "deparent");
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(void))(v8 + 16))();

  }
}

- (id)_requestConfigurationForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void (**v7)(_QWORD, _QWORD, double, double);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  -[UIWindowSceneActivationInteraction activeConfiguration](self, "activeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[UIWindowSceneActivationInteraction configurationProvider](self, "configurationProvider");
    v7 = (void (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, UIWindowSceneActivationInteraction *, double, double))v7)[2](v7, self, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_msgSend(v8, "copy");

      -[UIWindowSceneActivationInteraction view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "windowScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIWindowSceneActivationInteraction view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _UIWindowSceneActivationPrepareConfiguration(v9, v13, self, v12, &__block_literal_global_504);

    }
  }
  return -[UIWindowSceneActivationInteraction activeConfiguration](self, "activeConfiguration");
}

UIWindowSceneProminentPlacement *__71__UIWindowSceneActivationInteraction__requestConfigurationForLocation___block_invoke()
{
  return +[UIWindowSceneProminentPlacement prominentPlacement](UIWindowSceneProminentPlacement, "prominentPlacement");
}

- (void)_prepareEffectForActiveConfigurationAtLocation:(CGPoint)a3 completion:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int IsAnimatable;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIWindowSceneActivationInteraction activeConfiguration](self, "activeConfiguration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[UIWindowSceneActivationInteraction activeConfiguration](self, "activeConfiguration"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        IsAnimatable = _UIWindowSceneActivationIsAnimatable(v10),
        v10,
        v9,
        IsAnimatable))
  {
    -[UIWindowSceneActivationInteraction view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIWindowSceneActivationIdentifier identifierWithLocation:inView:](_UIWindowSceneActivationIdentifier, "identifierWithLocation:inView:", v12, x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIWindowSceneActivationInteraction activeConfiguration](self, "activeConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIWindowSceneActivationEffectDescriptor descriptorWithPreview:](_UIWindowSceneActivationEffectDescriptor, "descriptorWithPreview:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIContentEffectManager sharedManager](_UIContentEffectManager, "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __96__UIWindowSceneActivationInteraction__prepareEffectForActiveConfigurationAtLocation_completion___block_invoke;
    v21[3] = &unk_1E16E2FA0;
    v22 = v16;
    v18 = v16;
    objc_msgSend(v17, "compatibleEffectForKey:descriptor:constructor:", v13, v18, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindowSceneActivationInteraction setActiveEffect:](self, "setActiveEffect:", v19);

    -[UIWindowSceneActivationInteraction activeEffect](self, "activeEffect");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "begin");

    -[UIWindowSceneActivationInteraction _prewarmAnimationWithCompletion:](self, "_prewarmAnimationWithCompletion:", v7);
  }
  else
  {
    -[UIWindowSceneActivationInteraction _cancelInteraction](self, "_cancelInteraction");
  }

}

_UIWindowSceneActivationEffect *__96__UIWindowSceneActivationInteraction__prepareEffectForActiveConfigurationAtLocation_completion___block_invoke(uint64_t a1)
{
  return -[_UIWindowSceneActivationEffect initWithDescriptor:]([_UIWindowSceneActivationEffect alloc], "initWithDescriptor:", *(_QWORD *)(a1 + 32));
}

- (void)_endEffectWithVelocity:(double)a3 forActiveConfigurationWithCompletionStatus:(BOOL)a4
{
  id v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  if (a4)
  {
    -[UIWindowSceneActivationInteraction activeConfiguration](self, "activeConfiguration", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIWindowSceneActivationInteraction errorHandler](self, "errorHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UIWindowSceneActivateConfiguration(v5, 0, v6);

  }
  else
  {
    -[UIWindowSceneActivationInteraction activeEffect](self, "activeEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endExpanded:withVelocity:", 0, a3);

    -[UIWindowSceneActivationInteraction animator](self, "animator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reparent");
    -[UIWindowSceneActivationInteraction activeEffect](self, "activeEffect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __104__UIWindowSceneActivationInteraction__endEffectWithVelocity_forActiveConfigurationWithCompletionStatus___block_invoke;
    v11[3] = &unk_1E16E2FC8;
    v12 = v9;
    v5 = v9;
    objc_msgSend(v10, "addCompletion:", v11);

  }
  -[UIWindowSceneActivationInteraction setActiveConfiguration:](self, "setActiveConfiguration:", 0);
  -[UIWindowSceneActivationInteraction setActiveEffect:](self, "setActiveEffect:", 0);
  -[UIWindowSceneActivationInteraction setAnimator:](self, "setAnimator:", 0);
}

uint64_t __104__UIWindowSceneActivationInteraction__endEffectWithVelocity_forActiveConfigurationWithCompletionStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)_animateExpansionWithVelocity:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  _QWORD v10[5];

  -[UIWindowSceneActivationInteraction animator](self, "animator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowSceneActivationInteraction activeEffect](self, "activeEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handOffPreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "animateWithSourcePreview:velocity:", v7, a3);

  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__UIWindowSceneActivationInteraction__animateExpansionWithVelocity___block_invoke;
    v10[3] = &unk_1E16B1B28;
    v10[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
  }
  else
  {
    -[UIWindowSceneActivationInteraction activeEffect](self, "activeEffect");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endExpanded:withVelocity:", 0, a3);

  }
}

void __68__UIWindowSceneActivationInteraction__animateExpansionWithVelocity___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activeEffect");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endExpanded:withVelocity:", 0, 0.0);

}

- (void)_prepareSceneActivationConfiguration:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_setAnimationSource:", 2);
  -[UIWindowSceneActivationInteraction setActiveConfiguration:](self, "setActiveConfiguration:", v4);

}

- (BOOL)_canAnimateSceneActivationWithConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIWindowSceneActivationInteraction activeConfiguration](self, "activeConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)_requestSceneActivationWithConfiguration:(id)a3 animated:(BOOL)a4 sender:(id)a5 errorHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = a4;
  v13 = a3;
  v10 = a5;
  v11 = a6;
  if (v8)
  {
    -[UIWindowSceneActivationInteraction pinchGR](self, "pinchGR");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "velocity");
    -[UIWindowSceneActivationInteraction _animateExpansionWithVelocity:](self, "_animateExpansionWithVelocity:");

  }
  objc_msgSend((id)UIApp, "_requestSceneActivationWithConfiguration:animated:sender:errorHandler:", v13, 0, v10, v11);

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (id)configurationProvider
{
  return self->_configurationProvider;
}

- (void)setConfigurationProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIWindowSceneActivationConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setActiveConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_activeConfiguration, a3);
}

- (_UIWindowSceneActivationEffect)activeEffect
{
  return self->_activeEffect;
}

- (void)setActiveEffect:(id)a3
{
  objc_storeStrong((id *)&self->_activeEffect, a3);
}

- (_UIWindowSceneActivationAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (UIPinchGestureRecognizer)pinchGR
{
  return self->_pinchGR;
}

- (void)setPinchGR:(id)a3
{
  objc_storeStrong((id *)&self->_pinchGR, a3);
}

- (_UIDoubleTapInteraction)doubleTapInteraction
{
  return self->_doubleTapInteraction;
}

- (void)setDoubleTapInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapInteraction, 0);
  objc_storeStrong((id *)&self->_pinchGR, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_activeEffect, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_configurationProvider, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
