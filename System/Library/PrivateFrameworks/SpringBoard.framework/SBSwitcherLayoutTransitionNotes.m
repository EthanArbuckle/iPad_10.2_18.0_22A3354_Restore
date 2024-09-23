@implementation SBSwitcherLayoutTransitionNotes

- (SBSwitcherLayoutTransitionNotes)initWithFromPreviousState:(id)a3 currentLayoutState:(id)a4 transitionRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBSwitcherLayoutTransitionNotes *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL fromApp;
  BOOL fromHomeScreen;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL inManyApps;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL inHomeScreen;
  char v37;
  objc_super v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v39.receiver = self;
  v39.super_class = (Class)SBSwitcherLayoutTransitionNotes;
  v11 = -[SBSwitcherLayoutTransitionNotes init](&v39, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "source");
    v11->_isPIPRestore = v12 == 45;
    v11->_isSystemGesture = v12 == 11;
    v11->_isHomeButtonInitiated = v12 == 20;
    objc_msgSend(v8, "appLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "unlockedEnvironmentMode") == 2)
      v14 = 1;
    else
      v14 = objc_msgSend(v8, "isFloatingSwitcherVisible");
    v11->_fromSwitcher = v14;
    objc_msgSend(v8, "elements");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
      v16 = !v11->_fromSwitcher;
    else
      v16 = 0;
    v11->_fromApp = v16;

    v11->_fromHomeScreen = objc_msgSend(v8, "unlockedEnvironmentMode") == 1;
    objc_msgSend(v8, "elements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_fromManyApps = (unint64_t)objc_msgSend(v17, "count") > 1;

    objc_msgSend(v9, "appLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "unlockedEnvironmentMode") == 2)
      v19 = 1;
    else
      v19 = objc_msgSend(v9, "isFloatingSwitcherVisible");
    v11->_inAnySwitcher = v19;
    v11->_inHomeScreen = objc_msgSend(v9, "unlockedEnvironmentMode") == 1;
    objc_msgSend(v9, "elements");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
      v21 = !v11->_inAnySwitcher;
    else
      v21 = 0;
    v11->_inApp = v21;

    objc_msgSend(v9, "elements");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_inManyApps = (unint64_t)objc_msgSend(v22, "count") > 1;

    objc_msgSend(v9, "elements");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(v8, "elements");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_fromNoAppToApp = objc_msgSend(v24, "count") == 0;

    }
    else
    {
      v11->_fromNoAppToApp = 0;
    }

    fromApp = v11->_fromApp;
    if (fromApp)
      fromApp = v11->_inHomeScreen;
    v11->_fromAppToHomeScreen = fromApp;
    fromHomeScreen = v11->_fromHomeScreen;
    if (fromHomeScreen)
      fromHomeScreen = v11->_inApp;
    v11->_fromHomeScreenToApp = fromHomeScreen;
    objc_msgSend(v8, "elements");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "count"))
    {
      objc_msgSend(v9, "elements");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count"))
      {
        objc_msgSend(v8, "elements");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "elements");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_changingApps = objc_msgSend(v29, "isEqual:", v30) ^ 1;

      }
      else
      {
        v11->_changingApps = 0;
      }

    }
    else
    {
      v11->_changingApps = 0;
    }

    if (v13 == v18)
    {
      inManyApps = 0;
      v11->_movingFromManyApps = 0;
    }
    else
    {
      v11->_movingFromManyApps = v11->_fromManyApps;
      inManyApps = v11->_inManyApps;
    }
    v11->_movingToManyApps = inManyApps;
    objc_msgSend(v9, "elements");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "count") == 1)
    {
      objc_msgSend(v8, "elements");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "elements");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "anyObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_movingToSingleApp = objc_msgSend(v33, "containsObject:", v35) ^ 1;

    }
    else
    {
      v11->_movingToSingleApp = 0;
    }

    inHomeScreen = v11->_fromHomeScreen;
    if (inHomeScreen)
      inHomeScreen = v11->_inHomeScreen;
    v11->_stableInHomeScreen = inHomeScreen;
    if (v11->_fromApp && v11->_inApp)
    {
      v11->_stableInAppOrMovingBetweenSingleApp = !v11->_movingToManyApps && !v11->_movingFromManyApps;
      v37 = objc_msgSend(v13, "isEqual:", v18);
    }
    else
    {
      v37 = 0;
      v11->_stableInAppOrMovingBetweenSingleApp = 0;
    }
    v11->_stableInSameApp = v37;
    objc_storeWeak((id *)&v11->_fromAppLayout, v13);
    objc_storeWeak((id *)&v11->_inAppLayout, v18);

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inAppLayout);
  objc_destroyWeak((id *)&self->_fromAppLayout);
}

- (BOOL)inApp
{
  return self->_inApp;
}

- (BOOL)inAnySwitcher
{
  return self->_inAnySwitcher;
}

- (BOOL)fromHomeScreen
{
  return self->_fromHomeScreen;
}

- (BOOL)fromHomeScreenToApp
{
  return self->_fromHomeScreenToApp;
}

- (BOOL)inHomeScreen
{
  return self->_inHomeScreen;
}

- (BOOL)movingToSingleApp
{
  return self->_movingToSingleApp;
}

- (BOOL)isSystemGesture
{
  return self->_isSystemGesture;
}

- (BOOL)isPIPRestore
{
  return self->_isPIPRestore;
}

- (BOOL)fromNoAppToApp
{
  return self->_fromNoAppToApp;
}

- (BOOL)stableInHomeScreen
{
  return self->_stableInHomeScreen;
}

- (BOOL)stableInAppOrMovingBetweenSingleApp
{
  return self->_stableInAppOrMovingBetweenSingleApp;
}

- (BOOL)changingApps
{
  return self->_changingApps;
}

- (BOOL)fromAppToHomeScreen
{
  return self->_fromAppToHomeScreen;
}

- (BOOL)fromApp
{
  return self->_fromApp;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSwitcherLayoutTransitionNotes succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  SBSwitcherLayoutTransitionNotes *v12;
  _QWORD v13[4];
  id v14;
  SBSwitcherLayoutTransitionNotes *v15;
  _QWORD v16[4];
  id v17;
  SBSwitcherLayoutTransitionNotes *v18;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke;
  v16[3] = &unk_1E8E9E820;
  v5 = v3;
  v17 = v5;
  v18 = self;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Flags"), 0, v16);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke_2;
  v13[3] = &unk_1E8E9E820;
  v6 = v5;
  v14 = v6;
  v15 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("From AppLayout"), 0, v13);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke_3;
  v10[3] = &unk_1E8E9E820;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("In AppLayout"), 0, v10);
  v8 = v7;

  return v8;
}

id __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("fromSwitcher"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 9), CFSTR("fromApp"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 10), CFSTR("fromHomeScreen"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 11), CFSTR("fromManyApps"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 12), CFSTR("inAnySwitcher"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 13), CFSTR("inHomeScreen"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 14), CFSTR("inApp"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 15), CFSTR("inManyApps"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("fromNoAppToApp"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 17), CFSTR("fromHomeScreenToApp"));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 18), CFSTR("fromAppToHomeScreen"));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 19), CFSTR("stableInHomeScreen"));
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 20), CFSTR("stableInAppOrMovingBetweenSingleApp"));
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 21), CFSTR("stableInSameApp"));
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 22), CFSTR("changingApps"));
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 23), CFSTR("movingToSingleApp"));
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("movingToManyApps"));
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 25), CFSTR("movingFromManyApps"));
  v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 26), CFSTR("isPIPRestore"));
  v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 27), CFSTR("isSystemGesture"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 28), CFSTR("isHomeButtonInitiated"));
}

void __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  v2 = (id)objc_msgSend(v1, "appendObject:withName:skipIfNil:", WeakRetained, 0, 0);

}

void __61__SBSwitcherLayoutTransitionNotes_succinctDescriptionBuilder__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  v2 = (id)objc_msgSend(v1, "appendObject:withName:skipIfNil:", WeakRetained, 0, 0);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSwitcherLayoutTransitionNotes descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBAppLayout)fromAppLayout
{
  return (SBAppLayout *)objc_loadWeakRetained((id *)&self->_fromAppLayout);
}

- (BOOL)fromSwitcher
{
  return self->_fromSwitcher;
}

- (BOOL)fromManyApps
{
  return self->_fromManyApps;
}

- (SBAppLayout)inAppLayout
{
  return (SBAppLayout *)objc_loadWeakRetained((id *)&self->_inAppLayout);
}

- (BOOL)inManyApps
{
  return self->_inManyApps;
}

- (BOOL)stableInSameApp
{
  return self->_stableInSameApp;
}

- (BOOL)movingToManyApps
{
  return self->_movingToManyApps;
}

- (BOOL)movingFromManyApps
{
  return self->_movingFromManyApps;
}

- (BOOL)isHomeButtonInitiated
{
  return self->_isHomeButtonInitiated;
}

@end
