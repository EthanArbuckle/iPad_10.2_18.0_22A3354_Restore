@implementation UIViewServiceViewControllerOperator

uint64_t __132___UIViewServiceViewControllerOperator_operatorWithRemoteViewControllerProxy_hostPID_hostBundleID_hostAuditToken_sessionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareForDisconnectionUnconditionallyThen:", a2);
}

uint64_t __132___UIViewServiceViewControllerOperator_operatorWithRemoteViewControllerProxy_hostPID_hostBundleID_hostAuditToken_sessionIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateUnconditionallyThen:", a2);
}

void __61___UIViewServiceViewControllerOperator__objc_initiateDealloc__block_invoke(uint64_t a1)
{
  _UIDeallocOnMainThread(*(void **)(a1 + 32));
}

void __97___UIViewServiceViewControllerOperator_establishViewControllerDeputyWithProxy_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location[2];
  __int128 v20;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 984))
  {
    objc_msgSend(*(id *)(v2 + 1064), "_setHostApplicationBundleIdentifier:");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 1064), "_setHostProcessIdentifier:", *(unsigned int *)(v2 + 976));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1064);
  v3 += 992;
  v5 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)location = *(_OWORD *)v3;
  v20 = v5;
  objc_msgSend(v4, "_setHostAuditToken:", location);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    v6 = *(_QWORD *)(a1 + 40);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __97___UIViewServiceViewControllerOperator_establishViewControllerDeputyWithProxy_completionHandler___block_invoke_2;
    v17[3] = &unk_1E16E8EA0;
    objc_copyWeak(&v18, location);
    +[_UIQueueingProxy proxyWithTarget:shouldSuspendInvocationBlock:](_UIQueueingProxy, "proxyWithTarget:shouldSuspendInvocationBlock:", v6, v17);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 1048);
    *(_QWORD *)(v8 + 1048) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "suspend");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "_setRemoteViewControllerProxy:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));
    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "performSelector:withObject:", sel_willAppearInRemoteViewController_, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "_willAppearInRemoteViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "_willAppearInRemoteViewController");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 1064);
  v12 = *(unsigned int *)(v10 + 976);
  objc_msgSend((id)objc_opt_class(), "_exportedInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "protocol");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIViewServiceUIBehaviorProxy proxyWrappingExportedObject:forCommunicationWithPID:exportedProtocol:](_UIViewServiceUIBehaviorProxy, "proxyWrappingExportedObject:forCommunicationWithPID:exportedProtocol:", v11, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIViewServiceViewControllerDeputy deputyWithViewController:](_UIViewServiceViewControllerDeputy, "deputyWithViewController:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

BOOL __97___UIViewServiceViewControllerOperator_establishViewControllerDeputyWithProxy_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  Protocol *v6;
  _BOOL8 v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend((id)objc_opt_class(), "_remoteViewControllerInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "protocol");
    v6 = (Protocol *)objc_claimAutoreleasedReturnValue();

    v7 = v6
      && ((unint64_t)protocol_getMethodDescription(v6, (SEL)objc_msgSend(v3, "selector"), 1, 1).name
       || (unint64_t)protocol_getMethodDescription(v6, (SEL)objc_msgSend(v3, "selector"), 0, 1).name);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  mach_port_name_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  __int128 v34;
  void *v35;
  _QWORD block[4];
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = _statusBarStateStack_block_invoke___s_category[0];
  if (!_statusBarStateStack_block_invoke___s_category[0])
  {
    v2 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, _statusBarStateStack_block_invoke___s_category);
  }
  v3 = *(id *)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 48);
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v6);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = CFSTR("(nil)");
    }
    *(_DWORD *)buf = 138543362;
    v45 = v9;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Prepare for disconnection of operator: %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 48), "__setServiceInPopover:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1080), "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyboardSceneDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "_inputViewsKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v11;
  objc_msgSend(v11, "_clearPreservedInputViewsWithId:clearKeyboard:", v12, 0);

  objc_msgSend((id)UIApp, "_deliverRemainingKeyUpEvents");
  v13 = *(id *)(*(_QWORD *)(a1 + 48) + 1080);
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "postNotificationName:object:", CFSTR("_UIViewServiceHostedWindowWillDisconnectNotificationName"), v13);
    objc_msgSend(*(id *)(a1 + 48), "_presentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "completeCurrentTransitionImmediately");

    stopStealingStatusBar(*(void **)(*(_QWORD *)(a1 + 48) + 1080));
    -[_UIViewServiceSessionActivityRecord invalidate](*(_QWORD *)(*(_QWORD *)(a1 + 48) + 1288));
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(void **)(v15 + 1288);
    *(_QWORD *)(v15 + 1288) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1304), "invalidate");
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(void **)(v17 + 1304);
    *(_QWORD *)(v17 + 1304) = 0;

    objc_msgSend(*(id *)(a1 + 48), "_appearanceSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIAppearance _removeWindow:forSource:](_UIAppearance, "_removeWindow:forSource:", v13, v19);

    objc_msgSend(*(id *)(a1 + 32), "removeObserver:name:object:", *(_QWORD *)(a1 + 48), CFSTR("_UIHostedWindowDidRegisterScrollToTopViewNotification"), v13);
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:name:object:", *(_QWORD *)(a1 + 48), CFSTR("_UIHostedWindowDidUnregisterScrollToTopViewNotification"), v13);
    v20 = *(_QWORD *)(a1 + 48);
    v21 = *(void **)(v20 + 1080);
    *(_QWORD *)(v20 + 1080) = 0;

  }
  v22 = *(_QWORD *)(a1 + 48);
  v23 = *(_DWORD *)(v22 + 1120);
  if (v23)
  {
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], v23);
    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 1120) = 0;
    v22 = *(_QWORD *)(a1 + 48);
  }
  objc_msgSend(*(id *)(a1 + 32), "postNotificationName:object:", CFSTR("_UIViewServiceRemoteViewControllerWillDisconnectNotification"), *(_QWORD *)(v22 + 1048));
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1056), "copy");
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "identity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIScreen _FBSDisplayIdentityDisconnected:](UIScreen, "_FBSDisplayIdentityDisconnected:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v26);
  }

  v30 = *(_QWORD *)(a1 + 48);
  v31 = *(void **)(v30 + 1056);
  *(_QWORD *)(v30 + 1056) = MEMORY[0x1E0C9AA60];

  objc_msgSend(*(id *)(a1 + 48), "_queue");
  v32 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke_479;
  block[3] = &unk_1E16E8ED8;
  v34 = *(_OWORD *)(a1 + 40);
  v33 = (id)v34;
  v37 = v34;
  v38 = *(_QWORD *)(a1 + 56);
  dispatch_async(v32, block);

}

void __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke_479(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  __int128 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 1040);
  *(_QWORD *)(v2 + 1040) = 0;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 1048);
  *(_QWORD *)(v4 + 1048) = 0;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke_2;
  block[3] = &unk_1E16E8ED8;
  v7 = *(_OWORD *)(a1 + 32);
  v6 = (id)v7;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "_setRemoteViewControllerProxy:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "removeFromParentViewController");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "childViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "willMoveToParentViewController:", 0);
        objc_msgSend(v8, "_existingView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");

        objc_msgSend(v8, "removeFromParentViewController");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(v10 + 1064);
  *(_QWORD *)(v10 + 1064) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend((id)UIApp, "_endBackgroundTask:", *(_QWORD *)(a1 + 48));
}

uint64_t __71___UIViewServiceViewControllerOperator__invalidateUnconditionallyThen___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91___UIViewServiceViewControllerOperator___scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

void __110___UIViewServiceViewControllerOperator___hostDidUpdateAppearanceWithSerializedRepresentations_originalSource___block_invoke(id *a1)
{
  id v2;

  objc_msgSend(a1[4], "_appearanceSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIViewServiceUpdateAppearanceWithSerializedRepresentations(a1[5], a1[6], v2);

}

void __81___UIViewServiceViewControllerOperator___setHostTraitCollection_deferIfAnimated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id *v11;
  id v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[154];
    if (v4)
    {
      objc_msgSend(v4, "_animator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __81___UIViewServiceViewControllerOperator___setHostTraitCollection_deferIfAnimated___block_invoke_2;
      v10 = &unk_1E16B1B50;
      v11 = v3;
      v12 = *(id *)(a1 + 32);
      objc_msgSend(v5, "setTransitionActions:", &v7);
      objc_msgSend(v5, "animateTransition:", v3[154], v7, v8, v9, v10, v11);
      v6 = v3[154];
      v3[154] = 0;

    }
    else
    {
      objc_msgSend(v3[135], "_setHostTraitCollection:", *(_QWORD *)(a1 + 32));
    }
  }

}

uint64_t __81___UIViewServiceViewControllerOperator___setHostTraitCollection_deferIfAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_setHostTraitCollection:", *(_QWORD *)(a1 + 40));
}

id __139___UIViewServiceViewControllerOperator___hostWillTransitionToTraitCollection_withContextDescription_deferIfAnimated_inRemoteViewHierarchy___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
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
  void (**v15)(_QWORD);
  void **v16;
  void *v17;
  _UIViewControllerOneToOneTransitionContext *v18;
  void *v19;
  _UIViewControllerOneToOneTransitionContext *v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD aBlock[4];
  id v26;
  _UIViewControllerOneToOneTransitionContext *v27;
  uint64_t v28;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1080);
  v3 = v2;
  if (*(_BYTE *)(a1 + 56))
  {
    v4 = *(id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 1232);
    if (v14)
    {
      v15 = 0;
    }
    else
    {
      v18 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
      -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v18, "_setFromViewController:", v4);
      -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v18, "_setToViewController:", 0);
      -[_UIViewControllerTransitionContext _setContainerView:](v18, "_setContainerView:", v3);
      -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v18, "_setFromStartFrame:", v7, v9, v11, v13);
      -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v18, "_setToEndFrame:", v7, v9, v11, v13);
      -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v18, "_setToStartFrame:", v7, v9, v11, v13);
      -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v18, "_setFromEndFrame:", v7, v9, v11, v13);
      -[_UIViewControllerTransitionContext _setRotating:](v18, "_setRotating:", 0);
      +[_UIWindowAnimationController animationControllerWithWindow:](_UIHostedWindowAnimationController, "animationControllerWithWindow:", v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIViewControllerTransitionContext _setIsAnimated:](v18, "_setIsAnimated:", *(unsigned __int8 *)(a1 + 57));
      -[_UIViewControllerTransitionContext _setAnimator:](v18, "_setAnimator:", v19);
      -[_UIViewControllerTransitionContext _setCompletionCurve:](v18, "_setCompletionCurve:", objc_msgSend(*(id *)(a1 + 40), "completionCurve"));
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1232), v18);
      v15 = 0;
      if (!*(_BYTE *)(a1 + 58))
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __139___UIViewServiceViewControllerOperator___hostWillTransitionToTraitCollection_withContextDescription_deferIfAnimated_inRemoteViewHierarchy___block_invoke_2;
        aBlock[3] = &unk_1E16B47A8;
        v26 = v19;
        v20 = v18;
        v21 = *(_QWORD *)(a1 + 32);
        v27 = v20;
        v28 = v21;
        v15 = (void (**)(_QWORD))_Block_copy(aBlock);

      }
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 1232);
    }
    objc_msgSend(v14, "_transitionCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void **)(a1 + 48);
    objc_msgSend(v3, "_willTransitionToTraitCollection:withTransitionCoordinator:", *(_QWORD *)(a1 + 48), v17);
    if (v15)
    {
      v15[2](v15);

    }
  }
  else
  {
    v16 = (void **)(a1 + 48);
    objc_msgSend(v2, "_willTransitionToTraitCollection:withTransitionCoordinator:", *(_QWORD *)(a1 + 48), 0);
    v17 = 0;
  }
  if (*(_BYTE *)(a1 + 56))
    v22 = *v16;
  else
    v22 = 0;
  v23 = v22;

  return v23;
}

void __139___UIViewServiceViewControllerOperator___hostWillTransitionToTraitCollection_withContextDescription_deferIfAnimated_inRemoteViewHierarchy___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "animateTransition:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(v2 + 1232);
  *(_QWORD *)(v2 + 1232) = 0;

}

void __65___UIViewServiceViewControllerOperator__firstResponderDidChange___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1264])
    WeakRetained[1264] = 0;

}

void __82___UIViewServiceViewControllerOperator__wantsKeyboardEventsWithoutFirstResponder___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1264])
    WeakRetained[1264] = 0;

}

uint64_t __87___UIViewServiceViewControllerOperator___prepareForDisconnectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95___UIViewServiceViewControllerOperator_systemLayoutFittingSizeDidChangeForChildViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;

  v2 = (void *)MEMORY[0x186DC9484]();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  LODWORD(v5) = 1112014848;
  LODWORD(v7) = 1112014848;
  objc_msgSend(v3, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, v8, v5, v7);
  v10 = v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 40), "_window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_windowHostingScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_synchronizedDrawingFence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "__viewServiceInstrinsicContentSizeDidChange:fence:", v15, v10, v12);

  objc_msgSend(v15, "invalidate");
  objc_autoreleasePoolPop(v2);
}

void __82___UIViewServiceViewControllerOperator_presentationControllerDidAttemptToDismiss___block_invoke(uint64_t a1)
{
  UIPresentationController *v1;
  void *v2;

  v1 = -[UIPresentationController initWithPresentedViewController:presentingViewController:]([UIPresentationController alloc], "initWithPresentedViewController:presentingViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064), 0);
  v2 = (void *)_MergedGlobals_65;
  _MergedGlobals_65 = (uint64_t)v1;

}

void __93___UIViewServiceViewControllerOperator_dummyPopoverController_didChangeContentSize_animated___block_invoke(uint64_t a1, double a2, double a3)
{
  double v5;
  double v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1160));
  objc_msgSend(WeakRetained, "popoverContentSize");
  if (v6 != a2 || v5 != a3)
    objc_msgSend(WeakRetained, "_super_setPopoverContentSize:", a2, a3);

}

void __52___UIViewServiceViewControllerOperator_XPCInterface__block_invoke()
{
  _UIViewServiceViewControllerOperator_XPCInterface *v0;
  void *v1;

  v0 = objc_alloc_init(_UIViewServiceViewControllerOperator_XPCInterface);
  v1 = (void *)qword_1ECD79FE8;
  qword_1ECD79FE8 = (uint64_t)v0;

}

void __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1264])
    WeakRetained[1264] = 0;

}

uint64_t __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 1064), "_preferredInterfaceOrientationGivenCurrentOrientation:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

void __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke_3(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  id WeakRetained;
  id *v4;
  id v5;

  v1 = a1;
  v2 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1160));
  v4 = (id *)v1[4];
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v1 = objc_loadWeakRetained(v4 + 145);
    objc_msgSend(v1, "popoverContentSize");
  }
  else
  {
    objc_msgSend(v4, "preferredContentSize");
  }
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  if (v5)

}

uint64_t __79___UIViewServiceViewControllerOperator___hostDidMoveToParentSceneWithSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyToMutableSettings:", a2);
}

uint64_t __69___UIViewServiceViewControllerOperator___hostSceneDidUpdateWithDiff___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyToMutableSettings:", a2);
}

id __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_traitsWillChangeHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_traitsWillChangeHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_setTraitsWillChangeHandler:", 0);
  }
  -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8++), "willRotateToInterfaceOrientation:duration:", *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 584) |= 0x400uLL;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 48);
  v11 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, CFSTR("UIWindowNewOrientationUserInfoKey"), 0, (_QWORD)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("UIWindowWillRotateNotification"), v10, v13);

  return v2;
}

void __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_2(uint64_t a1, int a2)
{
  _BOOL8 v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  uint64_t v13;

  if (a2)
    v3 = objc_msgSend(*(id *)(a1 + 32), "count") != 0;
  else
    v3 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_3;
  v12[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
  v13 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_4;
  v6[3] = &unk_1E16E8FF0;
  v9 = *(_QWORD *)(a1 + 64);
  v5 = *(int8x16_t *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 72);
  v11 = v13;
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  v8 = *(id *)(a1 + 48);
  +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v3, v12, v6, 0);

}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, a2, a3, *(double *)(a1 + 32), 0.0);
}

void __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_4(uint64_t a1)
{
  UIStatusBarStyleAnimationParameters *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[UIKeyboardSceneDelegate setInterfaceOrientation:](UIKeyboardSceneDelegate, "setInterfaceOrientation:", *(_QWORD *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096) = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104) = *(_QWORD *)(a1 + 64);
  v2 = -[UIStatusBarStyleAnimationParameters initWithDefaultParameters]([UIStatusBarStyleAnimationParameters alloc], "initWithDefaultParameters");
  -[UIStatusBarAnimationParameters setDuration:](v2, "setDuration:", *(double *)(a1 + 72));
  stealStatusBar(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096), 0, *(void **)(*(_QWORD *)(a1 + 32) + 1080), 1);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7++), "rotateToInterfaceOrientation:duration:", *(_QWORD *)(a1 + 56), *(double *)(a1 + 72));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 48);
  v10 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("UIWindowNewOrientationUserInfoKey"), 0, (_QWORD)v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("UIWindowWillAnimateRotationNotification"), v9, v12);

}

void __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(void);
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v6++), "finishRotationFromInterfaceOrientation:", *(_QWORD *)(a1 + 64));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v4);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 584) &= ~0x400uLL;
  objc_msgSend(*(id *)(a1 + 40), "_setFromWindowOrientation:", *(_QWORD *)(a1 + 72));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("UIWindowOldOrientationUserInfoKey"), 0, (_QWORD)v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("UIWindowDidRotateNotification"), v8, v11);

  objc_msgSend(*(id *)(a1 + 48), "_traitsDidChangeHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 48), "_traitsDidChangeHandler");
    v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v13[2]();

    objc_msgSend(*(id *)(a1 + 48), "_setTraitsDidChangeHandler:", 0);
  }
  v14 = *(_QWORD *)(a1 + 56);
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "frame");
    v16 = v15;
    v18 = v17;
    objc_msgSend(*(id *)(a1 + 48), "_window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "statusBarHeight");
    v22 = v21;

    (*(void (**)(uint64_t, double, double, double))(v14 + 16))(v14, v16, v18, v22);
  }
}

id __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_6(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "_traitsWillChangeHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_traitsWillChangeHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_setTraitsWillChangeHandler:", 0);
  }
  return v2;
}

void __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_8(uint64_t a1)
{
  void *v2;
  void (**v3)(void);
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  objc_msgSend(*(id *)(a1 + 32), "_traitsDidChangeHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_traitsDidChangeHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "_setTraitsDidChangeHandler:", 0);
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "frame");
    v6 = v5;
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "_window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusBarHeight");
    v12 = v11;

    (*(void (**)(uint64_t, double, double, double))(v4 + 16))(v4, v6, v8, v12);
  }
}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1232);
  *(_QWORD *)(v2 + 1232) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_553(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 96))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504) = *(_QWORD *)(a1 + 72);
  if ((dyld_program_sdk_at_least() & 1) != 0 || !*(_BYTE *)(a1 + 97))
    objc_msgSend(*(id *)(a1 + 40), "__setBoundingPath:", *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(*(id *)(a1 + 40), "__setContentSize:boundingPath:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 80), *(double *)(a1 + 88));
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_setHostTraitCollection:");
  return result;
}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_2_554(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 96))
    objc_msgSend(*(id *)(a1 + 32), "__setContentSize:boundingPath:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 32), "__hostWillAnimateRotationToInterfaceOrientation:duration:skipSelf:", *(_QWORD *)(a1 + 80), 0, *(double *)(a1 + 88));
}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_3_556(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  result = objc_msgSend(*(id *)(a1 + 32), "__hostDidRotateFromInterfaceOrientation:skipSelf:", *(_QWORD *)(a1 + 56), 0);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "frame");
    v5 = v4;
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "statusBarHeight");
    v11 = v10;

    return (*(uint64_t (**)(uint64_t, double, double, double))(v3 + 16))(v3, v5, v7, v11);
  }
  return result;
}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_4_557(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
}

uint64_t __106___UIViewServiceViewControllerOperator___hostWillAnimateRotationToInterfaceOrientation_duration_skipSelf___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, a2, a3, *(double *)(a1 + 32), 0.0);
}

void __106___UIViewServiceViewControllerOperator___hostWillAnimateRotationToInterfaceOrientation_duration_skipSelf___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1112);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "rotateToInterfaceOrientation:duration:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __90___UIViewServiceViewControllerOperator___createViewControllerWithOptions_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _UIViewServiceControllerOperatorCreateResult *v6;

  v6 = objc_alloc_init(_UIViewServiceControllerOperatorCreateResult);
  objc_msgSend(*(id *)(a1 + 32), "hostingHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewServiceControllerOperatorCreateResult setServiceWindowHostingHandle:](v6, "setServiceWindowHostingHandle:", v2);

  objc_msgSend(*(id *)(a1 + 40), "_supportedInterfaceOrientationsForViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1064));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewServiceControllerOperatorCreateResult setSupportedInterfaceOrientations:](v6, "setSupportedInterfaceOrientations:", v3);

  objc_msgSend(*(id *)(a1 + 40), "_effectiveStatusBarStyleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewServiceControllerOperatorCreateResult setPreferredStatusBarStyle:](v6, "setPreferredStatusBarStyle:", objc_msgSend(v4, "preferredStatusBarStyle"));

  objc_msgSend(*(id *)(a1 + 40), "_effectiveStatusBarHiddenViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewServiceControllerOperatorCreateResult setPreferredStatusBarVisibility:](v6, "setPreferredStatusBarVisibility:", objc_msgSend(v5, "_preferredStatusBarVisibility"));

  -[_UIViewServiceControllerOperatorCreateResult setAccessibilityServerPort:](v6, "setAccessibilityServerPort:", *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __72___UIViewServiceViewControllerOperator__showServiceForType_withContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;

  if (!a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardSceneDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_inputViewsKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_preserveInputViewsWithId:animated:", v5, 1);

  }
}

void __99___UIViewServiceViewControllerOperator__showServiceForText_selectedTextRange_type_fromRect_inView___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;

  if (!a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardSceneDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_inputViewsKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_preserveInputViewsWithId:animated:", v5, 1);

  }
}

void __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke_2;
  v10[3] = &unk_1E16CB918;
  v7 = a1[4];
  v6 = a1[5];
  v8 = (void *)a1[6];
  v13 = a1[7];
  v10[4] = v6;
  v11 = v8;
  v12 = v5;
  v9 = v5;
  objc_msgSend(a2, "_timelinesForDateInterval:completion:", v7, v10);

}

void __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("UIViewServiceViewControllerOperator.m"), 3663, CFSTR("Call must be made on main thread"));

  }
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("UIViewServiceViewControllerOperator.m"), 3668, CFSTR("Call must be made on main thread"));

  }
  objc_msgSend(*(id *)(a1[4] + 1280), "specifierAtPresentationDate:", *(_QWORD *)(a1[4] + 1272));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00F38], "constructFrameSpecifiersForTimelines:dateInterval:shouldConstructStartSpecifier:framesPerSecond:previousSpecifier:", a1[5], a1[6], 0, 30.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 1280), "addSpecifiers:", v2);
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v21 = a1;
  v6 = a1[4];
  v7 = *(void **)(v6 + 1272);
  *(_QWORD *)(v6 + 1272) = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v2;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
        v15 = objc_alloc(MEMORY[0x1E0D00F28]);
        objc_msgSend(v14, "presentationInterval");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v15, "initWithDate:fidelity:", v17, objc_msgSend(v14, "requestedFidelity"));

        objc_msgSend(v8, "addObject:", v18);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  (*(void (**)(void))(v21[7] + 16))();
}

uint64_t __82___UIViewServiceViewControllerOperator___updateWithFrameSpecifierDate_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "_updateWithFrameSpecifier:completion:", *(_QWORD *)(a1 + 32), a3);
}

@end
