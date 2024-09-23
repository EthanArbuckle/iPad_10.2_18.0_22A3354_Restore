@implementation SBUIBannerClientContainerViewController

- (id)_transitionCoordinator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[NSObject systemApertureElementContextPrivate](self, "systemApertureElementContextPrivate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBUIBannerClientContainerViewController;
    -[SBUIBannerClientContainerViewController _transitionCoordinator](&v10, sel__transitionCoordinator);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  char v4;
  objc_super v5;

  -[NSObject systemApertureElementContextPrivate](self, "systemApertureElementContextPrivate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPresentationPossible");

  if ((v4 & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBUIBannerClientContainerViewController;
    -[BNBannerClientContainerViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  }
}

- (SBUIBannerClientContainerViewController)initWithScene:(id)a3 presentable:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  SBUIBannerClientContainerViewController *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBUIBannerClientContainerViewController;
  v10 = -[BNBannerClientContainerViewController initWithScene:presentable:context:](&v17, sel_initWithScene_presentable_context_, v8, v9, a5);
  if (v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "setBannerHomeGestureContext:", v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "setBannerDismissalPreventionContext:", v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = objc_opt_class();
      v12 = v8;
      if (v11)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
      }
      else
      {
        v13 = 0;
      }
      v14 = v13;

      objc_msgSend(v14, "systemApertureElementContextPrivate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "isPresentationPossible"))
        -[SBUIBannerClientContainerViewController systemApertureElementContextPresentationDidBecomePossible:](v10, "systemApertureElementContextPresentationDidBecomePossible:", v15);
      else
        objc_msgSend(v15, "addObserver:", v10);

    }
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  char v4;
  SBUIPresentableCancelSystemDragGestureRecognizer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBUIPresentableSupportsCancellingSystemDragAction *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBUIBannerClientContainerViewController;
  -[BNBannerClientContainerViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[BNBannerClientContainerViewController presentable](self, "presentable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = -[SBUIPresentableCancelSystemDragGestureRecognizer initWithTarget:action:]([SBUIPresentableCancelSystemDragGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleCancelSystemBannerDragGestureRecognizer_);
    -[SBUIPresentableCancelSystemDragGestureRecognizer setDelegate:](v5, "setDelegate:", self);
    -[SBUIBannerClientContainerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v5);

    -[BNBannerClientContainerViewController scene](self, "scene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_FBSScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = -[SBUIPresentableSupportsCancellingSystemDragAction initWithInfo:responder:]([SBUIPresentableSupportsCancellingSystemDragAction alloc], "initWithInfo:responder:", 0, 0);
    objc_msgSend(v9, "setWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendActions:", v11);

  }
}

- (BOOL)isAccessibilityIgnoringSmartInvertColors
{
  void *v2;
  char v3;

  -[BNBannerClientContainerViewController presentable](self, "presentable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)setWantsHomeGesture:(BOOL)a3
{
  _BOOL8 v3;
  SBUIPresentableWantsHomeGestureAction *v5;
  SBUIPresentableWantsHomeGestureAction *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  if (self->_ownsHomeGesture != a3)
  {
    v3 = a3;
    v5 = [SBUIPresentableWantsHomeGestureAction alloc];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__SBUIBannerClientContainerViewController_setWantsHomeGesture___block_invoke;
    v10[3] = &unk_1E4C3EBD0;
    v10[4] = self;
    v11 = v3;
    v6 = -[SBUIPresentableWantsHomeGestureAction initWithWantsHomeGesture:handler:](v5, "initWithWantsHomeGesture:handler:", v3, v10);
    -[BNBannerClientContainerViewController scene](self, "scene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_FBSScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, 0);
    objc_msgSend(v8, "sendActions:", v9);

  }
}

void __63__SBUIBannerClientContainerViewController_setWantsHomeGesture___block_invoke(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1048) = *(_BYTE *)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SBUIBannerClientContainerViewController_setWantsHomeGesture___block_invoke_2;
    block[3] = &unk_1E4C3E408;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __63__SBUIBannerClientContainerViewController_setWantsHomeGesture___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "homeGestureOwnershipDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1048));

}

- (id)acquireTransitionDismissalPreventionAssertionForReason:(id)a3
{
  id v5;
  _SBUIPresentableDismissalPreventionAssertion *WeakRetained;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _SBUIPresentableDismissalPreventionAssertion *v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;
  _QWORD v23[4];
  NSObject *v24;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBannerClientContainerViewController.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  WeakRetained = (_SBUIPresentableDismissalPreventionAssertion *)objc_loadWeakRetained((id *)&self->_transitionDismissalPreventionAssertion);
  -[BNBannerClientContainerViewController scene](self, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
  {
    SBLogBanners();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBUIBannerClientContainerViewController acquireTransitionDismissalPreventionAssertionForReason:].cold.1((uint64_t)WeakRetained, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    v15 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __98__SBUIBannerClientContainerViewController_acquireTransitionDismissalPreventionAssertionForReason___block_invoke;
    v23[3] = &unk_1E4C3F058;
    v16 = v5;
    v24 = v16;
    objc_msgSend(v7, "_updateUIClientSettingsWithBlock:", v23);
    objc_initWeak(&location, self);
    v17 = [_SBUIPresentableDismissalPreventionAssertion alloc];
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __98__SBUIBannerClientContainerViewController_acquireTransitionDismissalPreventionAssertionForReason___block_invoke_2;
    v20[3] = &unk_1E4C3F478;
    objc_copyWeak(&v21, &location);
    WeakRetained = -[_SBUIPresentableDismissalPreventionAssertion initWithDismissalSource:reason:invalidationHandler:](v17, "initWithDismissalSource:reason:invalidationHandler:", 1, v16, v20);
    objc_storeWeak((id *)&self->_transitionDismissalPreventionAssertion, WeakRetained);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    v8 = v24;
  }

  return WeakRetained;
}

void __98__SBUIBannerClientContainerViewController_acquireTransitionDismissalPreventionAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "setTransitionDismissalPreventionReason:", *(_QWORD *)(a1 + 32));
}

void __98__SBUIBannerClientContainerViewController_acquireTransitionDismissalPreventionAssertionForReason___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateUIClientSettingsWithBlock:", &__block_literal_global_16);

}

void __98__SBUIBannerClientContainerViewController_acquireTransitionDismissalPreventionAssertionForReason___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setTransitionDismissalPreventionReason:", 0);
}

- (id)acquireGestureRecognizerDefaultPriorityAssertionForReason:(id)a3
{
  id v5;
  _SBUIPresentableGestureRecognizerPriorityAssertion *WeakRetained;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _SBUIPresentableGestureRecognizerPriorityAssertion *v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;
  _QWORD v23[4];
  NSObject *v24;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBannerClientContainerViewController.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  WeakRetained = (_SBUIPresentableGestureRecognizerPriorityAssertion *)objc_loadWeakRetained((id *)&self->_gestureRecognizerPriorityAssertion);
  -[BNBannerClientContainerViewController scene](self, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
  {
    SBLogBanners();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBUIBannerClientContainerViewController acquireGestureRecognizerDefaultPriorityAssertionForReason:].cold.1((uint64_t)WeakRetained, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    v15 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __101__SBUIBannerClientContainerViewController_acquireGestureRecognizerDefaultPriorityAssertionForReason___block_invoke;
    v23[3] = &unk_1E4C3F058;
    v16 = v5;
    v24 = v16;
    objc_msgSend(v7, "_updateUIClientSettingsWithBlock:", v23);
    objc_initWeak(&location, self);
    v17 = [_SBUIPresentableGestureRecognizerPriorityAssertion alloc];
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __101__SBUIBannerClientContainerViewController_acquireGestureRecognizerDefaultPriorityAssertionForReason___block_invoke_2;
    v20[3] = &unk_1E4C3F4C0;
    objc_copyWeak(&v21, &location);
    WeakRetained = -[_SBUIPresentableGestureRecognizerPriorityAssertion initWithReason:invalidationHandler:](v17, "initWithReason:invalidationHandler:", v16, v20);
    objc_storeWeak((id *)&self->_gestureRecognizerPriorityAssertion, WeakRetained);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    v8 = v24;
  }

  return WeakRetained;
}

void __101__SBUIBannerClientContainerViewController_acquireGestureRecognizerDefaultPriorityAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "setWantsDefaultGesturePriorityReason:", *(_QWORD *)(a1 + 32));
}

void __101__SBUIBannerClientContainerViewController_acquireGestureRecognizerDefaultPriorityAssertionForReason___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateUIClientSettingsWithBlock:", &__block_literal_global_51);

}

void __101__SBUIBannerClientContainerViewController_acquireGestureRecognizerDefaultPriorityAssertionForReason___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setWantsDefaultGesturePriorityReason:", 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeginWithTouches:(id)a4 event:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  char v12;

  v7 = a4;
  v8 = a5;
  -[BNBannerClientContainerViewController presentable](self, "presentable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[BNBannerClientContainerViewController presentable](self, "presentable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldCancelSystemDragGestureWithTouches:event:", v7, v8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_handleCancelSystemBannerDragGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  SBUIPresentableCancelSystemDragAction *v6;
  void *v7;
  id v8;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[BNBannerClientContainerViewController scene](self, "scene");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_FBSScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = -[SBUIPresentableCancelSystemDragAction initWithInfo:responder:]([SBUIPresentableCancelSystemDragAction alloc], "initWithInfo:responder:", 0, 0);
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendActions:", v7);

  }
}

- (id)acquireAssertionForButtonEvent:(int64_t)a3 reason:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SBUIPresentableButtonEventsAction *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, int);
  void *v31;
  uint64_t *v32;
  id v33;
  id location;
  uint64_t v35;
  _QWORD v36[4];
  id v37;

  v7 = a4;
  v8 = v7;
  if (a3 == 1)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBannerClientContainerViewController.m"), 210, CFSTR("Invalid button evemt: %ld'"), a3);

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBannerClientContainerViewController.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

LABEL_3:
  v35 = 0;
  v36[0] = &v35;
  v36[1] = 0x3032000000;
  v36[2] = __Block_byref_object_copy__0;
  v36[3] = __Block_byref_object_dispose__0;
  -[SBUIBannerClientContainerViewController _buttonEventsActionForButtonEvent:](self, "_buttonEventsActionForButtonEvent:", a3);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(v36[0] + 40), "isValid") & 1) == 0)
  {
    v9 = *(void **)(v36[0] + 40);
    *(_QWORD *)(v36[0] + 40) = 0;

  }
  if (*(_QWORD *)(v36[0] + 40))
  {
    SBLogBanners();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBUIBannerClientContainerViewController acquireAssertionForButtonEvent:reason:].cold.1((uint64_t)v36, v10, v11, v12, v13, v14, v15, v16);

  }
  else
  {
    objc_initWeak(&location, self);
    v17 = [SBUIPresentableButtonEventsAction alloc];
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __81__SBUIBannerClientContainerViewController_acquireAssertionForButtonEvent_reason___block_invoke;
    v31 = &unk_1E4C3F510;
    objc_copyWeak(&v33, &location);
    v32 = &v35;
    v18 = -[SBUIPresentableButtonEventsAction initWithButtonEvent:reason:handler:](v17, "initWithButtonEvent:reason:handler:", a3, v8, &v28);
    v19 = *(void **)(v36[0] + 40);
    *(_QWORD *)(v36[0] + 40) = v18;

    -[BNBannerClientContainerViewController scene](self, "scene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_FBSScene");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc(MEMORY[0x1E0C99E60]);
    v23 = (void *)objc_msgSend(v22, "initWithObjects:", *(_QWORD *)(v36[0] + 40), 0, v28, v29, v30, v31);
    objc_msgSend(v21, "sendActions:", v23);

    -[SBUIBannerClientContainerViewController _setButtonEventAction:forButtonEvent:](self, "_setButtonEventAction:forButtonEvent:", *(_QWORD *)(v36[0] + 40), a3);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  v24 = *(id *)(v36[0] + 40);
  _Block_object_dispose(&v35, 8);

  return v24;
}

void __81__SBUIBannerClientContainerViewController_acquireAssertionForButtonEvent_reason___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t v13;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "presentable");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "presentableButtonEvent") == 1)
      {
        v8 = MEMORY[0x1E0C809B0];
        v9 = 3221225472;
        v10 = __81__SBUIBannerClientContainerViewController_acquireAssertionForButtonEvent_reason___block_invoke_2;
        v11 = &unk_1E4C3F4E8;
        v6 = v5;
        v7 = *(_QWORD *)(a1 + 32);
        v12 = v6;
        v13 = v7;
        dispatch_async(MEMORY[0x1E0C80D38], &v8);
        objc_msgSend(v4, "_removeButtonEventsActionForButtonEvent:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "presentableButtonEvent", v8, v9, v10, v11));

      }
    }

  }
}

uint64_t __81__SBUIBannerClientContainerViewController_acquireAssertionForButtonEvent_reason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleHomeButtonPress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SBUIBannerClientContainerViewController;
  -[BNBannerClientContainerViewController _respondToActions:forFBSScene:inUIScene:fromTransitionContext:](&v30, sel__respondToActions_forFBSScene_inUIScene_fromTransitionContext_, v10, a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v17);
        v19 = objc_opt_class();
        v20 = v18;
        if (v19)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v21 = v20;
          else
            v21 = 0;
        }
        else
        {
          v21 = 0;
        }
        v22 = v21;

        if (v22)
        {
          objc_msgSend(v12, "removeObject:", v22, (_QWORD)v26);
          -[BNBannerClientContainerViewController presentable](self, "presentable");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v24 = objc_msgSend(v23, "homeAffordanceDidCrossThreshold");
          else
            v24 = 1;
          objc_msgSend(v22, "setSuccessful:", v24);

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v15);
  }

  return v12;
}

- (void)systemApertureElementContextPresentationDidBecomePossible:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  -[BNBannerClientContainerViewController presentable](self, "presentable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[BNBannerClientContainerViewController presentable](self, "presentable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSystemApertureElementViewControllerProvider:", v7);
    objc_msgSend(v7, "systemApertureElementViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNBannerClientContainerViewController presentable](self, "presentable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIViewControllerFromPresentable();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBannerClientContainerViewController.m"), 267, CFSTR("BannerKit clients must provide a systemApertureElementViewController that is equal to the presentable's view controller."));

    }
  }
  objc_msgSend(v13, "removeObserver:", self);

}

- (id)_buttonEventsActionForButtonEvent:(int64_t)a3
{
  SBUIBannerClientContainerViewController *v4;
  NSMapTable *buttonEventsToActions;
  void *v6;
  void *v7;

  v4 = self;
  objc_sync_enter(v4);
  buttonEventsToActions = v4->_buttonEventsToActions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](buttonEventsToActions, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v7;
}

- (void)_setButtonEventAction:(id)a3 forButtonEvent:(int64_t)a4
{
  id v6;
  SBUIBannerClientContainerViewController *v7;
  NSMapTable *buttonEventsToActions;
  uint64_t v9;
  NSMapTable *v10;
  void *v11;
  id v12;

  v6 = a3;
  if (v6)
  {
    v12 = v6;
    v7 = self;
    objc_sync_enter(v7);
    buttonEventsToActions = v7->_buttonEventsToActions;
    if (!buttonEventsToActions)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v7->_buttonEventsToActions;
      v7->_buttonEventsToActions = (NSMapTable *)v9;

      buttonEventsToActions = v7->_buttonEventsToActions;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](buttonEventsToActions, "setObject:forKey:", v12, v11);

    objc_sync_exit(v7);
    v6 = v12;
  }

}

- (void)_removeButtonEventsActionForButtonEvent:(int64_t)a3
{
  NSMapTable *buttonEventsToActions;
  void *v5;
  NSMapTable *v6;
  SBUIBannerClientContainerViewController *obj;

  obj = self;
  objc_sync_enter(obj);
  buttonEventsToActions = obj->_buttonEventsToActions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](buttonEventsToActions, "removeObjectForKey:", v5);

  if (!-[NSMapTable count](obj->_buttonEventsToActions, "count"))
  {
    v6 = obj->_buttonEventsToActions;
    obj->_buttonEventsToActions = 0;

  }
  objc_sync_exit(obj);

}

- (BOOL)ownsHomeGesture
{
  return self->_ownsHomeGesture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonEventsToActions, 0);
  objc_destroyWeak((id *)&self->_gestureRecognizerPriorityAssertion);
  objc_destroyWeak((id *)&self->_transitionDismissalPreventionAssertion);
}

- (void)acquireTransitionDismissalPreventionAssertionForReason:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A471F000, a2, a3, "Already acquired a banner transition dismissal prevention assertion: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)acquireGestureRecognizerDefaultPriorityAssertionForReason:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A471F000, a2, a3, "Already acquired a gesture recognizer priority assertion: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)acquireAssertionForButtonEvent:(uint64_t)a3 reason:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A471F000, a2, a3, "Already acquired a button event assertion: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
