@implementation UIRemoteViewController

void __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2;
  block[3] = &unk_1E16E89A0;
  v12 = v6;
  v10 = *(_OWORD *)(a1 + 40);
  v7 = (id)v10;
  v15 = v10;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2(uint64_t a1)
{
  unsigned __int8 v1;
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  if ((v1 & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v3 = qword_1ECD78A40;
      if (!qword_1ECD78A40)
      {
        v3 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&qword_1ECD78A40);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v9 = 138543362;
        v10 = v5;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Connection handler called with error %{public}@", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_awakeWithConnectionInfo:", *(_QWORD *)(a1 + 48));
      v6 = qword_1ECD78A48;
      if (!qword_1ECD78A48)
      {
        v6 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&qword_1ECD78A48);
      }
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v9 = 138543362;
        v10 = v8;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Connection handler called with ready view controller %{public}@", (uint8_t *)&v9, 0xCu);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
}

void __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_340(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2_341;
  v7[3] = &unk_1E16BAE58;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "whenCompleteDo:", v7);

}

void __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2_341(uint64_t a1)
{
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

void __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (id)objc_msgSend(WeakRetained, "_terminateWithError:", v5);

}

uint64_t __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(v2, "bounds");
    objc_msgSend(v2, "convertRect:toView:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "bounds");
    +[UIScreen convertRect:fromView:](UIScreen, "convertRect:fromView:", *(_QWORD *)(a1 + 40));
  }
  v5 = v3;
  v6 = v4;
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1104), "setOrigin:", v5, v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1112), "setOrigin:", v5, v6);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1120), "setOrigin:", v8, v10);
}

uint64_t __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateUnconditionallyThen:", a2);
}

uint64_t __53___UIRemoteViewController__statusBarHeightDidChange___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[132];
  objc_msgSend(v1, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarHeight");
  v6 = v5;

  return objc_msgSend(v2, "__hostDidChangeStatusBarHeight:", v6);
}

uint64_t __59___UIRemoteViewController__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__hostWillEnterForeground");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "__hostWillEnterForeground");
}

uint64_t __53___UIRemoteViewController__sceneWillEnterForeground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__hostSceneWillEnterForeground");
}

void __66___UIRemoteViewController__snapshotAndRemoveTextEffectsRemoteView__block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_66 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Spotlight"));

}

void __54___UIRemoteViewController__applicationWillDeactivate___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E1A9AB48, &unk_1E1A9AB60, &unk_1E1A9AB78, &unk_1E1A9AB90, &unk_1E1A9ABA8, &unk_1E1A9ABC0, &unk_1E1A9ABD8, &unk_1E1A9ABF0, &unk_1E1A9AC08, &unk_1E1A9AC20, &unk_1E1A9AC38, &unk_1E1A9AC50, &unk_1E1A9AC68, &unk_1E1A9AC80, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD78A58;
  qword_1ECD78A58 = v0;

}

uint64_t __78___UIRemoteViewController__setContentOverlayInsets_andLeftMargin_rightMargin___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1056);
  objc_msgSend(*(id *)(v2 + 1088), "_remoteViewServiceInsetsFromInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "_remoteViewServiceGeometryValueFromValue:", *(double *)(a1 + 72));
  v13 = v12;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "_remoteViewServiceGeometryValueFromValue:", *(double *)(a1 + 80));
  return objc_msgSend(v3, "__hostDidSetContentOverlayInsets:andLeftMargin:rightMargin:", v5, v7, v9, v11, v13, v14);
}

void __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 976), "disconnect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke_2;
  v5[3] = &unk_1E16E8A10;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "whenCompleteDo:", v5);

}

void __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke_2(uint64_t a1)
{
  id v1;
  __int128 v2;
  _QWORD block[4];
  __int128 v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke_3;
  block[3] = &unk_1E16E8A10;
  v2 = *(_OWORD *)(a1 + 32);
  v1 = (id)v2;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke_3(uint64_t a1)
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
  uint64_t v13;
  os_unfair_lock_s *v14;
  mach_port_name_t os_unfair_lock_opaque;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_RemoteViewControllerPropagatesUIAppearance_block_invoke_3___s_category;
  if (!_UIInternalPreference_RemoteViewControllerPropagatesUIAppearance_block_invoke_3___s_category)
  {
    v2 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_RemoteViewControllerPropagatesUIAppearance_block_invoke_3___s_category);
  }
  v3 = *(id *)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 40);
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
    v31 = v9;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Finishing termination for remote view controller: %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "_existingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(a1 + 40);
  if (v12)
  {
    if (*(_QWORD *)(v13 + 1240))
    {
      objc_msgSend((id)v13, "_setWantsKeyboardEnvironmentEventDeferring:", 0);
      v13 = *(_QWORD *)(a1 + 40);
    }
    if (*(_QWORD *)(v13 + 1264))
    {
      -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t *)v13);
      v13 = *(_QWORD *)(a1 + 40);
    }
  }
  objc_msgSend(*(id *)(v13 + 984), "endUsing:", &__block_literal_global_443);
  v14 = *(os_unfair_lock_s **)(a1 + 40);
  os_unfair_lock_opaque = v14[254]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque)
  {
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], os_unfair_lock_opaque);
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1016) = 0;
    v14 = *(os_unfair_lock_s **)(a1 + 40);
  }
  os_unfair_lock_lock(v14 + 292);
  v16 = *(id *)(*(_QWORD *)(a1 + 40) + 1176);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 1168));
  objc_msgSend(*(id *)(a1 + 40), "viewServiceDidTerminateWithError:", v16);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1192), "setDelegate:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1192), "removeFromSuperview");
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(v17 + 1192);
  *(_QWORD *)(v17 + 1192) = 0;

  v19 = *(_QWORD *)(a1 + 40);
  v20 = *(void **)(v19 + 1000);
  *(_QWORD *)(v19 + 1000) = 0;

  v21 = *(_QWORD *)(a1 + 40);
  v22 = *(void **)(v21 + 992);
  *(_QWORD *)(v21 + 992) = 0;

  v23 = *(_QWORD *)(a1 + 40);
  v24 = *(void **)(v23 + 1056);
  *(_QWORD *)(v23 + 1056) = 0;

  v25 = *(_QWORD *)(a1 + 40);
  v26 = *(void **)(v25 + 1072);
  *(_QWORD *)(v25 + 1072) = 0;

  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1400);
  if (v27)
  {
    -[_UISceneKeyboardProxyLayerForwardingPresentationViewService invalidate](v27);
    v28 = *(_QWORD *)(a1 + 40);
    v29 = *(void **)(v28 + 1400);
    *(_QWORD *)(v28 + 1400) = 0;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke_442(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  if (a2)
  {
    v2 = a2;
    objc_msgSend(v2, "userInfo");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("error cleaning up %@ info %@"), v2, v3);

  }
}

void __48___UIRemoteViewController__objc_initiateDealloc__block_invoke(uint64_t a1)
{
  _UIDeallocOnMainThread(*(void **)(a1 + 32));
}

void __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_2;
  v3[3] = &unk_1E16B1BF8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "performAsync:", v3);

}

uint64_t __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_4;
  v9[3] = &unk_1E16C0600;
  v7 = *(id *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v12 = a2;
  v8 = v5;
  objc_msgSend(v6, "performAsync:", v9);

}

uint64_t __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;
  _BOOL8 v3;

  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    if (*(_QWORD *)(a1 + 32))
      v3 = 0;
    else
      v3 = *(unsigned __int8 *)(a1 + 48) != 0;
    return (*(uint64_t (**)(uint64_t, _BOOL8))(result + 16))(result, v3);
  }
  return result;
}

void __42___UIRemoteViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1376) = objc_msgSend(*(id *)(a1 + 32), "_viewControllerUnderlapsStatusBar");
  objc_msgSend(*(id *)(a1 + 32), "_sheetPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "_tryToConnectToRemoteSheet:", *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[132];
  v6 = *(unsigned __int8 *)(a1 + 40);
  v7 = objc_msgSend(v4, "_preferredInterfaceOrientation");
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_traitCollectionForServiceFromTraitCollection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "statusBarHeight");
  v14 = v13;

  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(unsigned __int8 *)(v15 + 1376);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42___UIRemoteViewController_viewWillAppear___block_invoke_2;
  v17[3] = &unk_1E16CBA40;
  v17[4] = v15;
  objc_msgSend(v5, "__hostViewWillAppear:inInterfaceOrientation:traitCollection:statusBarHeight:underlapsStatusBar:completionHandler:", v6, v7, v10, v16, v17, v14);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "__hostViewWillAppear:", *(unsigned __int8 *)(a1 + 40));
}

void __42___UIRemoteViewController_viewWillAppear___block_invoke_2(uint64_t a1, double a2, double a3)
{
  void *v7;
  _QWORD v8[7];

  if (a2 != *MEMORY[0x1E0C9D820] || a3 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42___UIRemoteViewController_viewWillAppear___block_invoke_3;
    v8[3] = &unk_1E16B4E70;
    v8[4] = *(_QWORD *)(a1 + 32);
    *(double *)&v8[5] = a2;
    *(double *)&v8[6] = a3;
    objc_msgSend(v7, "performAsync:", v8);

  }
}

uint64_t __42___UIRemoteViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  id *v1;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[136], "_sizeFromRemoteViewServiceSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(v1, "setPreferredContentSize:");
}

uint64_t __53___UIRemoteViewController__updateServiceSceneContext__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__hostDidUpdateSceneContext:", *(_QWORD *)(a1 + 40));
}

uint64_t __60___UIRemoteViewController__viewWillMoveFromWindow_toWindow___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1376) = objc_msgSend(*(id *)(a1 + 32), "_viewControllerUnderlapsStatusBar");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[132];
  v4 = objc_msgSend(v2, "_preferredInterfaceOrientationForWindow:", *(_QWORD *)(a1 + 40));
  __UIStatusBarManagerForWindow(*(void **)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarHeight");
  v7 = v6;

  return objc_msgSend(v3, "__hostViewWillMoveToWindowInInterfaceOrientation:withStatusBarHeight:underlapsStatusBar:", v4, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1376), v7);
}

BOOL __58___UIRemoteViewController__systemReferenceAngleDidChange___block_invoke(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "unsignedIntValue");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "_contextId");
}

void __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "_awaitingReply");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "displayIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_2;
  v8[3] = &unk_1E16E8A60;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "__hostViewDidMoveToScreenWithFBSDisplayIdentity:newHostingHandleReplyHandler:", v3, v8);

  if (objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "_awaitingReply");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_4;
    v6[3] = &unk_1E16E8A88;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "__hostViewDidMoveToScreenWithNewHostingHandleReplyHandler:", v6);

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_3;
    v5[3] = &unk_1E16B1B50;
    v6 = v3;
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "performReplyActionsInsideSynchronousReply:", v5);

  }
}

uint64_t __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1096), "setHostedWindowHostingHandle:");
  return objc_msgSend(*(id *)(a1 + 40), "_updateUnderflowProperties");
}

void __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_5;
    v8[3] = &unk_1E16B47A8;
    v9 = v5;
    v10 = WeakRetained;
    v11 = v6;
    objc_msgSend(WeakRetained, "performReplyActionsInsideSynchronousReply:", v8);

  }
}

uint64_t __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_5(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_QWORD *)(result + 32))
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 1104), "setHostedWindowHostingHandle:");
  if (*(_QWORD *)(v1 + 48))
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 1120), "setHostedWindowHostingHandle:");
  return result;
}

uint64_t __45___UIRemoteViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__hostViewWillDisappear:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "__hostViewWillDisappear:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_cancelProxiedEditAlertViewAnimated:", *(unsigned __int8 *)(a1 + 40));
}

void __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  id v25;
  __n128 v26;
  uint64_t v27;
  _QWORD v28[5];
  __n128 v29;
  uint64_t v30;

  v25 = a2;
  +[_UIViewControllerTransitionCoordinatorContextDescription descriptionForTransitionCoordinatorContext:](_UIViewControllerTransitionCoordinatorContextDescription, "descriptionForTransitionCoordinatorContext:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToOrientation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setFromOrientation:", *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 1128))
  {
    *(_BYTE *)(v4 + 1136) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_restoreTextEffectsRemoteView");
    v4 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v4, "updateTouchInterdictionViewLayout");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1376) = objc_msgSend(*(id *)(a1 + 32), "_viewControllerUnderlapsStatusBar");
  v5 = (void *)MEMORY[0x186DC9484]();
  objc_msgSend(*(id *)(a1 + 32), "_fenceForSynchronizedDrawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0uLL;
  v30 = 0;
  if (_UIUpdateCycleEnabled() && v6)
    *(_QWORD *)&v7 = _UIUpdateSchedulerRequestUpdate((uint64_t)&_UIUpdateCycleMainScheduler, 0, &v29).n128_u64[0];
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 1056);
  objc_msgSend(*(id *)(v8 + 1088), "_sizeForRemoteViewService", v7);
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "_boundingPathForRemoteViewService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "statusBarHeight");
  v18 = v17;

  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(unsigned __int8 *)(v19 + 1376);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v28[3] = &unk_1E16E8AB0;
  v28[4] = v19;
  v26 = v29;
  v27 = v30;
  objc_msgSend(v9, "__hostViewWillTransitionToSize:withContextDescription:boundingPath:statusBarHeight:underlapsStatusBar:fence:timing:whenDone:", v3, v14, v20, v6, &v26, v28, v11, v13, v18);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "_clearNeedsRemoteViewServiceBoundingPathUpdate");
  objc_msgSend(v6, "invalidate");

  objc_autoreleasePoolPop(v5);
  v21 = *(void **)(*(_QWORD *)(a1 + 32) + 1088);
  objc_msgSend(v21, "frame");
  objc_msgSend(v21, "_updateTextEffectsGeometries:");
  v22 = *(void **)(*(_QWORD *)(a1 + 32) + 1088);
  objc_msgSend(v22, "window");
  v23 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _fbsScene](v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_updateSceneGeometries:forOrientation:", v24, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_endDeferringProxySheetConfigurationUpdates");
}

uint64_t __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, double a2, double a3, double a4)
{
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v19;
  _QWORD v21[6];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "_sizeForRemoteViewService");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "_window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "statusBarHeight");
  v15 = v14;

  v16 = vabdd_f64(a2, v9);
  if (vabdd_f64(a3, v11) >= 0.00000011920929 || v16 >= 0.00000011920929 || v15 != a4)
  {
    v19 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v21[3] = &unk_1E16B1888;
    v21[4] = v19;
    *(double *)&v21[5] = v15;
    objc_msgSend(v19, "_synchronizeAnimationsInActionsIfNecessary:", v21);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setIsUpdatingSize:", 0);
}

uint64_t __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__hostDidChangeStatusBarHeight:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateUnderflowProperties");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1056);
  objc_msgSend(*(id *)(v2 + 1088), "_sizeForRemoteViewService");
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "_boundingPathForRemoteViewService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__setContentSize:boundingPath:", v8, v5, v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "_clearNeedsRemoteViewServiceBoundingPathUpdate");
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1088);
  objc_msgSend(v9, "frame");
  return objc_msgSend(v9, "_updateTextEffectsGeometries:");
}

void __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  _BYTE *v3;
  void *v4;
  int v5;
  double v6;
  id v7;

  v7 = a2;
  v3 = *(_BYTE **)(a1 + 32);
  if (v3[1136])
  {
    objc_msgSend(v3, "_snapshotAndRemoveTextEffectsRemoteView");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1136) = 0;
    v3 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v3, "_setIsUpdatingSizeInHost:", 0);
  if (_isPerformingSystemSnapshot(*(void **)(a1 + 32)))
  {
    v4 = (void *)MEMORY[0x1E0CB3978];
    v5 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RemoteViewControllerSnapshotDelay, (uint64_t)CFSTR("RemoteViewControllerSnapshotDelay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v6 = *(double *)&qword_1EDDA8388;
    if (v5)
      v6 = 0.08;
    objc_msgSend(v4, "sleepForTimeInterval:", v6);
  }

}

uint64_t __114___UIRemoteViewController__willAnimateRotationToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__hostWillAnimateRotationToInterfaceOrientation:duration:skipSelf:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 48));
}

uint64_t __105___UIRemoteViewController__willRotateToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__hostWillRotateToInterfaceOrientation:duration:skipSelf:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 48));
}

uint64_t __97___UIRemoteViewController__didRotateFromInterfaceOrientation_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__hostDidRotateFromInterfaceOrientation:skipSelf:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __143___UIRemoteViewController___viewServiceDidUpdatePreferredStatusBarStyle_preferredStatusBarVisibility_updateAnimation_currentAnimationSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

uint64_t __102___UIRemoteViewController___viewServiceDidUpdatePreferredWhitePointAdaptationStyle_animationSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsWhitePointAdaptivityStyleUpdate");
}

uint64_t __68___UIRemoteViewController___viewServiceDidUpdateClientToHostAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendClientToHostAction:", *(_QWORD *)(a1 + 40));
}

void __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD);
  _QWORD aBlock[5];
  id v8;
  id v9;

  +[_UIViewControllerTransitionCoordinatorContextDescription descriptionForTransitionCoordinatorContext:](_UIViewControllerTransitionCoordinatorContextDescription, "descriptionForTransitionCoordinatorContext:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2;
  aBlock[3] = &unk_1E16B47A8;
  v4 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v5 = v3;
  v9 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((objc_msgSend(*(id *)(a1 + 32), "_isUpdatingSize") & 1) != 0
    || *(_BYTE *)(a1 + 48) && (objc_msgSend(*(id *)(a1 + 32), "__shouldRemoteViewControllerFenceOperations") & 1) == 0)
  {
    v6[2](v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "synchronizeAnimationsInActions:", v6);
  }

}

void __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = (void *)v2[132];
  v6 = _shouldDeferSendingTraitCollectionChangeToService(v2);
  objc_msgSend(*(id *)(a1 + 32), "_existingView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__hostWillTransitionToTraitCollection:withContextDescription:deferIfAnimated:inRemoteViewHierarchy:", v3, v4, v6, v7 != 0);

}

uint64_t __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  void *v3;
  int v4;
  double v5;

  result = _isPerformingSystemSnapshot(*(void **)(a1 + 32));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_isUpdatingSizeInHost");
    if ((result & 1) == 0)
    {
      v3 = (void *)MEMORY[0x1E0CB3978];
      v4 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RemoteViewControllerSnapshotDelay, (uint64_t)CFSTR("RemoteViewControllerSnapshotDelay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      v5 = *(double *)&qword_1EDDA8388;
      if (v4)
        v5 = 0.08;
      return objc_msgSend(v3, "sleepForTimeInterval:", v5);
    }
  }
  return result;
}

uint64_t __63___UIRemoteViewController___setSupportedInterfaceOrientations___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1008), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateOfSupportedInterfaceOrientations");
}

void __63___UIRemoteViewController___setViewServiceIsDisplayingPopover___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  UIDimmingView *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1192);
  if (v2)
  {
    if (!*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v2, "setDelegate:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "removeFromSuperview");
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 1192);
      *(_QWORD *)(v3 + 1192) = 0;

    }
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    v5 = [UIDimmingView alloc];
    v6 = -[UIDimmingView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 1192);
    *(_QWORD *)(v7 + 1192) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setAutoresizingMask:", 18);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHitTestsAsOpaque:", 0);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setFrame:", 0.0, 0.0, v12, v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "window");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1192));

  }
}

void __99___UIRemoteViewController__serviceWantsKeyboardEventsWithPromotedFirstResponder_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id *v25;
  id v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  id v33;

  objc_msgSend(*(id *)(a1 + 32), "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activationState");
  v5 = objc_msgSend(v3, "activationState");
  if (v33)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (!v6 && (v4 == 1 || v5 == 0))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "isFirstResponder");
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "activePresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "activePresentationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_wantsAutomaticFirstResponderWhenPresentingRemoteViewController");

      if (!v12)
        goto LABEL_36;
    }
    v13 = *(_BYTE *)(a1 + 48) ? v8 : 1;
    if ((v13 & 1) != 0)
      goto LABEL_36;
    objc_msgSend(v33, "windowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_eventDeferringManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (unint64_t)(-[_UIEventDeferringManager compareRemoteRuleOwningElement:toTopElementInEnvironment:]((uint64_t)v15, *(id *)(a1 + 32), (uint64_t)v16)+ 1) < 2|| v33 != v9;

    }
    else
    {
      v18 = 0;
    }
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "responder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "inputViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") && v18 && v22)
    {
      objc_msgSend(*(id *)(a1 + 32), "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isDescendantOfView:", v22);

      if ((v24 & 1) != 0)
        goto LABEL_35;
    }
    else if (!v18)
    {
LABEL_35:

LABEL_36:
      if (objc_msgSend(v33, "canBecomeKeyWindow") && (objc_msgSend(v33, "_isTextEffectsWindow") & 1) == 0)
      {
        v26 = v33;
      }
      else
      {
        objc_msgSend(v33, "windowScene");
        v25 = (id *)objc_claimAutoreleasedReturnValue();
        -[UIWindowScene _keyWindow](v25);
        v26 = (id)objc_claimAutoreleasedReturnValue();

      }
      v27 = 0;
      if (v26 && v26 != v9)
      {
        if (v9 && (unint64_t)(_UIWindowCompareToWindow(v9, v33) + 1) > 1)
        {
          v27 = 0;
        }
        else
        {
          objc_msgSend(v26, "makeKeyWindow");
          v27 = 1;
        }
      }
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "windowScene");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "windowScene");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v27 & 1) == 0 && v29 != v30
        || !+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled")
        || !objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow"))
      {
        goto LABEL_55;
      }
      if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
      {
        if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
        {
LABEL_55:
          objc_msgSend(*(id *)(a1 + 32), "_setWantsKeyboardEnvironmentEventDeferring:", 1);
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

          goto LABEL_56;
        }
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "keyboardArbiterClient");
        v32 = (_QWORD *)objc_claimAutoreleasedReturnValue();

        -[_UIKeyboardArbiterClientInputDestination performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:servicePID:](v32, v33, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "servicePID"));
      }
      else
      {
        +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
        v32 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        -[_UIRemoteKeyboards performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:servicePID:]((uint64_t)v32, v33, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "servicePID"));
      }

      goto LABEL_55;
    }
    if ((objc_msgSend(v19, "ignoresPinning") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
    }
    else
    {
      objc_msgSend(v19, "setIgnoresPinning:", 1);
      objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
      objc_msgSend(v19, "setIgnoresPinning:", 0);
    }
    goto LABEL_35;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_56:

}

void __100___UIRemoteViewController___viewServicePopoverDidChangeContentSize_animated_fence_withReplyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_synchronizeDrawingWithFence:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  v4 = *(id **)(a1 + 32);
  objc_msgSend(v4[136], "_sizeFromRemoteViewServiceSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v4, "setPreferredContentSize:");
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD **)(a1 + 32);
  v7 = (void *)v6[136];
  objc_msgSend(v6, "_popoverController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "popoverView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v7, "_remoteViewServiceSizeFromSize:", v10, v11);
  (*(void (**)(uint64_t))(v5 + 16))(v5);

}

uint64_t __76___UIRemoteViewController___viewServicePreferredContentSizeDidChange_fence___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;

  objc_msgSend(*(id *)(a1 + 32), "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_synchronizeDrawingWithFence:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  v4 = *(id **)(a1 + 32);
  objc_msgSend(v4[136], "_sizeFromRemoteViewServiceSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  return objc_msgSend(v4, "setPreferredContentSize:");
}

uint64_t __77___UIRemoteViewController___viewServiceInstrinsicContentSizeDidChange_fence___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_synchronizeDrawingWithFence:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[136];
  objc_msgSend(v5, "_sizeFromRemoteViewServiceSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v4, "intrinsicContentSizeForServiceSize:");
  objc_msgSend(v5, "updateIntrinsicContentSize:");
  return objc_msgSend(*(id *)(a1 + 32), "viewDidInvalidateIntrinsicContentSize");
}

uint64_t __91___UIRemoteViewController__updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__setSheetConfiguration:", *(_QWORD *)(a1 + 40));
}

void __97___UIRemoteViewController___viewServiceSheetPresentationClientConfigurationDidChange_attributes___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __59___UIRemoteViewController__appearanceInvocationsDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__hostDidUpdateAppearanceWithSerializedRepresentations:originalSource:", a2, a3);
}

void __66___UIRemoteViewController__initializeAccessibilityPortInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _DWORD *WeakRetained;
  mach_port_name_t v8;
  mach_port_name_t v9;
  mach_port_name_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "AX Exchange error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = objc_msgSend(v5, "extractPortAndIKnowWhatImDoingISwear");
    if (v8 - 1 <= 0xFFFFFFFD && WeakRetained)
    {
      v9 = v8;
      if (mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v8, 0, 1))
        v10 = 0;
      else
        v10 = v9;
      WeakRetained[254] = v10;
    }

  }
}

uint64_t __73___UIRemoteViewController___showServiceForType_withContext_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  _QWORD v11[4];
  id v12;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setView:", v3);

  }
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_showServiceForType:withContext:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 1184);
  *(_QWORD *)(v6 + 1184) = v5;

  v8 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v8 + 1184))
  {
    objc_initWeak(&location, (id)v8);
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 1184);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73___UIRemoteViewController___showServiceForType_withContext_replyHandler___block_invoke_2;
    v11[3] = &unk_1E16E6B88;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v9, "setDismissedHandler:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(v8 + 1056), "__textServiceDidDismiss");
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __73___UIRemoteViewController___showServiceForType_withContext_replyHandler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[132], "__textServiceDidDismiss");
    v2 = v3[148];
    v3[148] = 0;

    WeakRetained = v3;
  }

}

void __103___UIRemoteViewController___showServiceForText_selectedTextRangeValue_type_fromRectValue_replyHandler___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "CGRectValue");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = objc_msgSend(v10, "rangeValue");
    v13 = v12;
  }
  else
  {
    v13 = objc_msgSend(*(id *)(a1 + 48), "length");
    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 56), "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 72);
  v16 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_showServiceForText:selectedTextRange:type:fromRect:inView:", v16, v11, v13, v15, v17, v3, v5, v7, v9);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(void **)(v19 + 1184);
  *(_QWORD *)(v19 + 1184) = v18;

  objc_initWeak(&location, *(id *)(a1 + 56));
  v21 = *(void **)(*(_QWORD *)(a1 + 56) + 1184);
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __103___UIRemoteViewController___showServiceForText_selectedTextRangeValue_type_fromRectValue_replyHandler___block_invoke_2;
  v27 = &unk_1E16E6B88;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v21, "setDismissedHandler:", &v24);
  v22 = *(_QWORD *)(a1 + 56);
  if (!*(_QWORD *)(v22 + 1184))
    objc_msgSend(*(id *)(v22 + 1056), "__textServiceDidDismiss", v24, v25, v26, v27);
  v23 = *(_QWORD *)(a1 + 64);
  if (v23)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v23 + 16))(v23, 0, 0);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __103___UIRemoteViewController___showServiceForText_selectedTextRangeValue_type_fromRectValue_replyHandler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[132], "__textServiceDidDismiss");
    v2 = v3[148];
    v3[148] = 0;

    WeakRetained = v3;
  }

}

uint64_t __63___UIRemoteViewController___dismissTextServiceSessionAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "dismissTextServiceAnimated:", *(unsigned __int8 *)(a1 + 40));
}

void __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_2;
  v2[3] = &unk_1E16B1B50;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:](UIUndoGestureInteraction, "presentProductivityGestureTutorialIfNeededWithCompletion:", v2);

}

uint64_t __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__cancelAlertActionWithToken:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1328));
  objc_msgSend(*(id *)(a1 + 32), "_endNoPresentingViewControllerAlertController:", *(_QWORD *)(a1 + 40));
  return +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", CFSTR("UndoCancel"), CFSTR("Shake"));
}

void __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  void *v5;
  uint64_t v6;
  id v7;

  v2 = MEMORY[0x1E0C809B0];
  v3 = 3221225472;
  v4 = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_4;
  v5 = &unk_1E16B1B50;
  v1 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = v1;
  +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:](UIUndoGestureInteraction, "presentProductivityGestureTutorialIfNeededWithCompletion:", &v2);
  +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", CFSTR("Undo"), CFSTR("Shake"), v2, v3, v4, v5, v6);

}

uint64_t __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__undoActionWithToken:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1328));
  return objc_msgSend(*(id *)(a1 + 32), "_endNoPresentingViewControllerAlertController:", *(_QWORD *)(a1 + 40));
}

void __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_5(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_6;
  v2[3] = &unk_1E16B1B50;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:](UIUndoGestureInteraction, "presentProductivityGestureTutorialIfNeededWithCompletion:", v2);

}

uint64_t __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "__redoActionWithToken:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1328));
  objc_msgSend(*(id *)(a1 + 32), "_endNoPresentingViewControllerAlertController:", *(_QWORD *)(a1 + 40));
  return +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", CFSTR("Redo"), CFSTR("Shake"));
}

void __54___UIRemoteViewController__prepareTouchDeliveryPolicy__block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  id v5;

  v3 = *(const char **)(a1 + 40);
  v4 = a2;
  NSStringFromSelector(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@: Sending touch delivery policy %@ failed with error: %@"), v5, *(_QWORD *)(a1 + 32), v4);

}

void __71___UIRemoteViewController__cancelTouchesForCurrentEventInHostedContent__block_invoke(uint64_t a1, void *a2)
{
  const char *v2;
  id v3;
  id v4;

  v2 = *(const char **)(a1 + 32);
  v3 = a2;
  NSStringFromSelector(v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@: Sending cancellation touch delivery policy failed with error: %@"), v4, v3);

}

void __64___UIRemoteViewController___trampolineButtonPressData_canceled___block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD78A88;
  qword_1ECD78A88 = (uint64_t)&unk_1E1A950A8;

}

void __64___UIRemoteViewController__timelinesForDateInterval_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0D00F40];
        objc_msgSend(v10, "date", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "entryForPresentationTime:withRequestedFidelity:", v12, objc_msgSend(v10, "fidelity"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v14 = (void *)MEMORY[0x1E0D00F38];
  objc_msgSend(*(id *)(a1 + 32), "_timelineID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timelineWithEntries:identifier:configure:", v4, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(_QWORD *)(a1 + 40);
  v23 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

}

void __56___UIRemoteViewController_removeAppProtectionShieldView__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_sheetPresentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tryToConnectToRemoteSheet:", *(_QWORD *)(a1 + 32));

}

void __57___UIRemoteViewController_shieldViewUnlockButtonPressed___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2)
    {
      v7 = qword_1ECD78AB0;
      if (!qword_1ECD78AB0)
      {
        v7 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&qword_1ECD78AB0);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        objc_msgSend(WeakRetained, "serviceBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v10;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Extension authenticated: %@", buf, 0xCu);

      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57___UIRemoteViewController_shieldViewUnlockButtonPressed___block_invoke_624;
      block[3] = &unk_1E16B1B28;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      v11 = qword_1ECD78AB8;
      if (!qword_1ECD78AB8)
      {
        v11 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1ECD78AB8);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        objc_msgSend(WeakRetained, "serviceBundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v14;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "Extension not authenticated: %@", buf, 0xCu);

      }
    }
    if (v5)
    {
      v15 = qword_1ECD78AC0;
      if (!qword_1ECD78AC0)
      {
        v15 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&qword_1ECD78AC0);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v5;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Error attempting to unlock %@:", buf, 0xCu);
      }
    }
  }

}

uint64_t __57___UIRemoteViewController_shieldViewUnlockButtonPressed___block_invoke_624(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAppProtectionShieldView");
}

void __72___UIRemoteViewController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && objc_msgSend(*(id *)(a1 + 32), "containsObject:", WeakRetained[129]))
  {
    if (objc_msgSend(WeakRetained[129], "requiresShielding"))
    {
      v3 = qword_1ECD78AC8;
      if (!qword_1ECD78AC8)
      {
        v3 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&qword_1ECD78AC8);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        objc_msgSend(WeakRetained, "serviceBundleIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Extension was locked by monitor %@", (uint8_t *)&v11, 0xCu);

      }
      objc_msgSend(WeakRetained, "presentAppProtectionShieldView");
      objc_msgSend(WeakRetained, "requestAppProtectionAuthIfNecessary");
    }
    else
    {
      v7 = qword_1ECD78AD0;
      if (!qword_1ECD78AD0)
      {
        v7 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&qword_1ECD78AD0);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        objc_msgSend(WeakRetained, "serviceBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v10;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Extension was unlocked by monitor %@", (uint8_t *)&v11, 0xCu);

      }
      objc_msgSend(WeakRetained, "removeAppProtectionShieldView");
    }
  }

}

@end
