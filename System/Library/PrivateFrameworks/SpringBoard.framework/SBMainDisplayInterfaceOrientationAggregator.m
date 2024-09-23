@implementation SBMainDisplayInterfaceOrientationAggregator

- (SBMainDisplayInterfaceOrientationAggregator)init
{
  SBMainDisplayInterfaceOrientationAggregator *v2;
  id v3;
  uint64_t v4;
  BSInvalidatable *stateCaptureHandle;
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBMainDisplayInterfaceOrientationAggregator;
  v2 = -[SBMainDisplayInterfaceOrientationAggregator init](&v9, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v7, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v4 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (BSInvalidatable *)v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __51__SBMainDisplayInterfaceOrientationAggregator_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBMainDisplayInterfaceOrientationAggregator;
  -[SBMainDisplayInterfaceOrientationAggregator dealloc](&v3, sel_dealloc);
}

- (int64_t)activeInterfaceOrientation
{
  return -[SBMainDisplayInterfaceOrientationAggregator activeInterfaceOrientationAtOrBelow:](self, "activeInterfaceOrientationAtOrBelow:", 1.79769313e308);
}

- (NSArray)interfaceOrientationSources
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEAC18], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_objectsOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[SBMainDisplayInterfaceOrientationAggregator _sortSources:](self, "_sortSources:", v5);

  return (NSArray *)v5;
}

- (int64_t)activeInterfaceOrientationBelow:(double)a3
{
  void *v3;
  int64_t v4;

  -[SBMainDisplayInterfaceOrientationAggregator highestActiveInterfaceOrientationSourceBelow:](self, "highestActiveInterfaceOrientationSourceBelow:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activeInterfaceOrientation");

  return v4;
}

- (int64_t)activeInterfaceOrientationAtOrBelow:(double)a3
{
  void *v3;
  int64_t v4;

  -[SBMainDisplayInterfaceOrientationAggregator highestActiveInterfaceOrientationSourceIgnoringSourcesAbove:](self, "highestActiveInterfaceOrientationSourceIgnoringSourcesAbove:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activeInterfaceOrientation");

  return v4;
}

- (id)highestActiveInterfaceOrientationSource
{
  return -[SBMainDisplayInterfaceOrientationAggregator highestActiveInterfaceOrientationSourceIgnoringSourcesAbove:](self, "highestActiveInterfaceOrientationSourceIgnoringSourcesAbove:", 1.79769313e308);
}

- (id)highestActiveInterfaceOrientationSourceIgnoringSourcesAbove:(double)a3
{
  void *v5;
  void *v6;

  -[SBMainDisplayInterfaceOrientationAggregator interfaceOrientationSources](self, "interfaceOrientationSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainDisplayInterfaceOrientationAggregator _highestSourceAtOrBelow:amongSources:](self, "_highestSourceAtOrBelow:amongSources:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)highestActiveInterfaceOrientationSourceBelow:(double)a3
{
  double v4;
  void *v5;
  void *v6;

  v4 = a3 + -0.01;
  -[SBMainDisplayInterfaceOrientationAggregator interfaceOrientationSources](self, "interfaceOrientationSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainDisplayInterfaceOrientationAggregator _highestSourceAtOrBelow:amongSources:](self, "_highestSourceAtOrBelow:amongSources:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)_layoutOrientation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation");

  return v6;
}

- (void)_sortSources:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_71);
}

uint64_t __60__SBMainDisplayInterfaceOrientationAggregator__sortSources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "orientationSourceLevel");
  v6 = v5;
  objc_msgSend(v4, "orientationSourceLevel");
  v8 = v7;

  v9 = -1;
  if (v8 <= v6)
    v9 = 1;
  if (v6 == v8)
    return 0;
  else
    return v9;
}

- (id)_highestSourceAtOrBelow:(double)a3 amongSources:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "orientationSourceLevel");
    v8 = v7;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "orientationSourceLevel", (_QWORD)v21);
          v16 = v15;
          if (objc_msgSend(v14, "isActive"))
            v17 = v16 < v8;
          else
            v17 = 1;
          if (!v17 && v16 <= a3)
          {
            v19 = v14;

            v6 = v19;
            v8 = v16;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  return -[SBMainDisplayInterfaceOrientationAggregator descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBMainDisplayInterfaceOrientationAggregator succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  BSInterfaceOrientationDescription();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("orientation"));

  return v2;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBMainDisplayInterfaceOrientationAggregator descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBMainDisplayInterfaceOrientationAggregator *v11;

  v4 = a3;
  -[SBMainDisplayInterfaceOrientationAggregator succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "interfaceOrientationSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("orientationSourceDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v4, CFSTR("active orientation sources"), v5, 1);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "activeMultilinePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v31[3] = &unk_1E8E9E820;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v32 = v9;
  v33 = v10;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("notions of interface orientation"), v7, v31);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "activeMultilinePrefix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v8;
  v29[1] = 3221225472;
  v29[2] = __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v29[3] = &unk_1E8E9DED8;
  v30 = *(id *)(a1 + 32);
  objc_msgSend(v11, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("notions of device orientation"), v12, v29);

  v13 = objc_opt_class();
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rootViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(void **)(a1 + 32);
  objc_msgSend(v17, "_autorotationPreventionReasons");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v19, CFSTR("home screen autorotation prevention reasons"), v20, 1);

  v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend((id)SBApp, "wantsOrientationEvents"), CFSTR("springBoardWantsOrientationEvents"));
  v22 = *(void **)(a1 + 32);
  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v22, "appendObject:withName:", v23, CFSTR("orientationLockManager"));

  v25 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEAC18], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bs_filter:", &__block_literal_global_53_0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v27, CFSTR("disabled main screen active orientation windows"), v28, 1);

}

void __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  BSInterfaceOrientationDescription();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("activeInterfaceOrientation"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend((id)SBApp, "statusBarOrientationForEmbeddedDisplay");
  BSInterfaceOrientationDescription();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("statusBarOrientation"));

  v8 = *(void **)(a1 + 32);
  SBSystemGestureOrientation();
  BSInterfaceOrientationDescription();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("systemGestureOrientation"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_layoutOrientation");
  BSInterfaceOrientationDescription();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "appendObject:withName:", v13, CFSTR("layoutOrientation"));

}

void __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int IsOrientationLockedWithOrientation;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orientation");
  BSDeviceOrientationDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("uiDeviceOrientation"));

  v6 = *(void **)(a1 + 32);
  BKHIDServicesGetNonFlatDeviceOrientation();
  BSDeviceOrientationDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("bksNonFlatDeviceOrientation"));

  v9 = *(void **)(a1 + 32);
  BKHIDServicesGetCurrentDeviceOrientation();
  BSDeviceOrientationDescription();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, CFSTR("bksCurrentDeviceOrientation"));

  IsOrientationLockedWithOrientation = BKSHIDServicesIsOrientationLockedWithOrientation();
  v13 = *(void **)(a1 + 32);
  if (IsOrientationLockedWithOrientation)
  {
    BSDeviceOrientationDescription();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "appendObject:withName:", v14, CFSTR("bksLockedOrientation"));

  }
  else
  {
    v16 = (id)objc_msgSend(v13, "appendObject:withName:", CFSTR("(unlocked)"), CFSTR("bksLockedOrientation"));
  }
}

uint64_t __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isDisablingInterfaceOrientationChanges");
  else
    v3 = 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
}

@end
