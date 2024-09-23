@implementation UIViewServiceTextEffectsOperator

uint64_t __101___UIViewServiceTextEffectsOperator_operatorWithRemoteViewControllerProxy_hostPID_sessionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareForDisconnectionUnconditionallyThen:", a2);
}

uint64_t __101___UIViewServiceTextEffectsOperator_operatorWithRemoteViewControllerProxy_hostPID_sessionIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateUnconditionallyThen:", a2);
}

void __81___UIViewServiceTextEffectsOperator__prepareForDisconnectionUnconditionallyThen___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 168);
  *(_QWORD *)(v2 + 168) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "windowScene");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "keyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  if (v6 != v7)
  {

LABEL_3:
    goto LABEL_4;
  }
  v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(v17, "firstResponder");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

    goto LABEL_3;
  }
  v19 = (void *)v18;
  v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(v20, "firstResponder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "responder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 == v22)
    objc_msgSend(v5, "_preserveInputViewsWithId:animated:", 0, 0);
LABEL_4:
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  UIKeyboardSafariDepresentForViewService();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_clearPreservedInputViewsWithId:clearKeyboard:", v9, _activeTextEffectsOperator == *(_QWORD *)(a1 + 32));

  v10 = (void *)_activeTextEffectsOperator;
  v11 = *(_QWORD *)(a1 + 32);
  if (_activeTextEffectsOperator == v11)
  {
    _activeTextEffectsOperator = 0;

    v11 = *(_QWORD *)(a1 + 32);
  }
  objc_storeWeak((id *)(v11 + 48), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[UITextEffectsHostingInfo hostingInfoForWindowScene:](UITextEffectsHostingInfo, "hostingInfoForWindowScene:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "useHostedInstance");

    if (v13)
    {
      +[UITextEffectsHostingInfo hostingInfoForWindowScene:](UITextEffectsHostingInfo, "hostingInfoForWindowScene:", v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setUseHostedInstance:", 0);

    }
  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "finishWithHostedWindow");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObserver:", *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke_2;
  v5[3] = &unk_1E16E8A10;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "whenCompleteDo:", v5);

}

void __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 40), "_queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke_3;
  block[3] = &unk_1E16E8A10;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  dispatch_async(v2, block);

}

uint64_t __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58___UIViewServiceTextEffectsOperator__objc_initiateDealloc__block_invoke(uint64_t a1)
{
  _UIDeallocOnMainThread(*(void **)(a1 + 32));
}

void __55___UIViewServiceTextEffectsOperator___setWindowOffset___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_isTextEffectsWindow"))
    objc_msgSend(v3, "setHostedViewOrigin:", *(double *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 64));

}

void __54___UIViewServiceTextEffectsOperator__reloadSafeInsets__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_isTextEffectsWindow")
    && objc_msgSend(v3, "_isHostedInAnotherProcess"))
  {
    objc_msgSend(v3, "setHostedSafeInsets:", *(double *)(*(_QWORD *)(a1 + 32) + 72), *(double *)(*(_QWORD *)(a1 + 32) + 80), *(double *)(*(_QWORD *)(a1 + 32) + 88), *(double *)(*(_QWORD *)(a1 + 32) + 96));
  }

}

uint64_t __84___UIViewServiceTextEffectsOperator___prepareForDisconnectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49___UIViewServiceTextEffectsOperator_XPCInterface__block_invoke()
{
  _UIViewServiceTextEffectsOperator_XPCInterface *v0;
  void *v1;

  v0 = objc_alloc_init(_UIViewServiceTextEffectsOperator_XPCInterface);
  v1 = (void *)qword_1ECD821A0;
  qword_1ECD821A0 = (uint64_t)v0;

}

void __68___UIViewServiceTextEffectsOperator_forceSyncToStatusBarOrientation__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowWithinAppWindow");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_resetHostedViewSize");
  }
  else
  {
    objc_msgSend(v9, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_boundsForInterfaceOrientation:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v9, "setSize:", v7, v8);

  }
}

void __79___UIViewServiceTextEffectsOperator_setHostedWindow_disableAutomaticBehaviors___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained(WeakRetained + 6);
  if (WeakRetained && v2)
  {
    objc_msgSend(v2, "_windowHostingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_userInterfaceIdiom");

    +[_UIViewServiceSessionActivityRecord activityRecordForProvider:userInterfaceIdiom:]((uint64_t)_UIViewServiceSessionActivityRecord, *(_WORD **)(a1 + 32), v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = WeakRetained[21];
    WeakRetained[21] = (id)v6;

    objc_msgSend(WeakRetained, "_installActivityObserverGestureIfNeeded");
  }

}

void __79___UIViewServiceTextEffectsOperator_willRotateToInterfaceOrientation_duration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "rootViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window:willRotateToInterfaceOrientation:duration:", v3, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

void __75___UIViewServiceTextEffectsOperator_rotateToInterfaceOrientation_duration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a2;
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window:willAnimateRotationToInterfaceOrientation:duration:", v3, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

  objc_msgSend(v3, "rootViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v3, "rootViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v7, v9, v11, v13);

}

void __76___UIViewServiceTextEffectsOperator_finishRotationFromInterfaceOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "rootViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window:didRotateFromInterfaceOrientation:", v3, *(_QWORD *)(a1 + 32));

}

@end
