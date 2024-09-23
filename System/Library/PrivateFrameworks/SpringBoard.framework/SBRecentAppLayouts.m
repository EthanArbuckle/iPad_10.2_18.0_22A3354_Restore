@implementation SBRecentAppLayouts

void __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "type") && objc_msgSend(v5, "type") != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SBRecentAppLayouts.m"), 405, CFSTR("Only Apps may be added to app switcher model"));

  }
}

BOOL __34__SBRecentAppLayouts__saveRecents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "type"))
    v3 = objc_msgSend(v2, "type") == 5;
  else
    v3 = 1;

  return v3;
}

- (id)mostRecentAppLayoutIncludingHiddenAppLayouts:(BOOL)a3 passingTest:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__130;
  v18 = __Block_byref_object_dispose__130;
  v19 = 0;
  -[SBRecentAppLayouts recentsIncludingHiddenAppLayouts:](self, "recentsIncludingHiddenAppLayouts:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__SBRecentAppLayouts_mostRecentAppLayoutIncludingHiddenAppLayouts_passingTest___block_invoke;
  v11[3] = &unk_1E8EC1730;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __42__SBRecentAppLayouts__lastInteractionTime__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForItem:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "lastInteractionTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  if (v2 > v4)
    v4 = v2;
  *(_QWORD *)(v3 + 24) = v4;

}

- (int64_t)_nextInteractionTime
{
  return -[SBRecentAppLayouts _lastInteractionTime](self, "_lastInteractionTime") + 1;
}

- (int64_t)_lastInteractionTime
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[SBRecentAppLayouts recentsIncludingHiddenAppLayouts:](self, "recentsIncludingHiddenAppLayouts:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SBRecentAppLayouts__lastInteractionTime__block_invoke;
  v5[3] = &unk_1E8EA5FF0;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__SBRecentAppLayouts__lastInteractionTime__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SBRecentAppLayouts__lastInteractionTime__block_invoke_2;
  v6[3] = &unk_1E8EA85E0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v5, "enumerate:", v6);

}

- (id)recentsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4
{
  uint64_t v4;

  v4 = 32;
  if (a4)
    v4 = 24;
  return (id)objc_msgSend(*(id *)((char *)&self->super.isa + v4), "objectForKey:", a3);
}

- (BOOL)_transitionContextRepresentsAmbiguousLaunch:(id)a3 forApplicationSceneEntity:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;

  v6 = a4;
  objc_msgSend(a3, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "source");

  objc_msgSend(v6, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    goto LABEL_20;
  }
  if ((unint64_t)(v8 - 3) >= 0x33)
  {
    v11 = 0;
    if (!v6)
      goto LABEL_20;
  }
  else
  {
    v11 = 0;
    if (((0x5040100000301uLL >> (v8 - 3)) & 1) != 0 || !v6)
      goto LABEL_20;
  }
  if (v8 != 52)
  {
    objc_msgSend(v6, "application");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isWebApplication") & 1) != 0
      || (objc_msgSend(v12, "info"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "supportsMultiwindow"),
          v13,
          !v14))
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v12, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentAppLayouts recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:](self, "recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      -[SBRecentAppLayouts recentsForBundleIdentifier:includingHiddenAppLayouts:](self, "recentsForBundleIdentifier:includingHiddenAppLayouts:", v15, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      v11 = v17 > 1 && v19 > 1;
    }

  }
LABEL_20:

  return v11;
}

- (id)recentDisplayItemsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4
{
  uint64_t v4;

  v4 = 48;
  if (a4)
    v4 = 40;
  return (id)objc_msgSend(*(id *)((char *)&self->super.isa + v4), "objectForKey:", a3);
}

- (id)recentsIncludingHiddenAppLayouts:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (a3)
    v3 = 8;
  return *(id *)((char *)&self->super.isa + v3);
}

uint64_t __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isDisplayItemRestrictedOrUnsupported:", a2) ^ 1;
}

- (BOOL)_isDisplayItemRestrictedOrUnsupported:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  SBApplicationPlaceholderController *placeholderController;
  void *v15;
  void *v16;
  char v17;
  _BOOL4 v18;
  void *v19;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "type"))
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v5 = 0;
LABEL_18:

      goto LABEL_19;
    }
    -[SBIconController model](self->_iconController, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expectedIconForDisplayIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBRecentAppLayouts _isApplicationSupported:](self, "_isApplicationSupported:", v6);
    if ((objc_msgSend(v7, "isIconVisible:", v8) & 1) == 0)
    {
      objc_msgSend(v8, "application");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v10, "info");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isAppClip");

        if ((v13 & 1) == 0)
        {
LABEL_13:
          v18 = -[SBRecentAppLayouts _ignoresAppHiddenForDisplayItem:](self, "_ignoresAppHiddenForDisplayItem:", v4);
          goto LABEL_14;
        }
      }
      else
      {
        placeholderController = self->_placeholderController;
        objc_msgSend(v4, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBApplicationPlaceholderController placeholderForDisplayID:](placeholderController, "placeholderForDisplayID:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_13;
        v17 = objc_msgSend(v16, "isAppClip");

        if ((v17 & 1) == 0)
          goto LABEL_13;
        v9 = 1;
      }
    }
    v18 = 1;
LABEL_14:
    -[SBApplicationController restrictionController](self->_applicationController, "restrictionController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isApplicationIdentifierRestricted:", v6);

    if (v18)
      v5 = v20 | !v9;
    else
      v5 = 1;

    goto LABEL_18;
  }
  v5 = 0;
LABEL_19:

  return v5;
}

- (BOOL)_isApplicationSupported:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SBApplicationController applicationWithBundleIdentifier:](self->_applicationController, "applicationWithBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supports64Bit");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_ignoresAppHiddenForDisplayItem:(id)a3
{
  id v4;
  NSMutableDictionary *allowHiddenAppAssertions;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  allowHiddenAppAssertions = self->_allowHiddenAppAssertions;
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](allowHiddenAppAssertions, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "allowedHiddenApplicationBundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "containsObject:", v10);

  }
  return v8;
}

void __79__SBRecentAppLayouts_mostRecentAppLayoutIncludingHiddenAppLayouts_passingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)addToFront:(id)a3
{
  -[SBRecentAppLayouts addAppLayout:atIndex:](self, "addAppLayout:atIndex:", a3, 0);
}

- (void)addAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[6];
  _QWORD v46[5];
  _QWORD v47[3];
  _QWORD v48[5];

  v48[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRecentAppLayouts.m"), 386, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inAppLayout != nil"));

  }
  if (objc_msgSend(v7, "type"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRecentAppLayouts.m"), 387, CFSTR("Only Apps may be added to app switcher model"));

  }
  v8 = self->_allRecents;
  v9 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke;
  v46[3] = &unk_1E8E9DF50;
  v46[4] = self;
  objc_msgSend(v7, "appLayoutWithItemsPassingTest:", v46);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (a4
    || (-[NSMutableArray firstObject](v8, "firstObject"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v10),
        v11,
        (v12 & 1) == 0))
  {
    if (v10)
    {
      -[SBRecentAppLayouts delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v9;
      v45[1] = 3221225472;
      v45[2] = __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_2;
      v45[3] = &unk_1E8EA4EA0;
      v45[4] = self;
      v45[5] = a2;
      objc_msgSend(v10, "enumerate:", v45);
      v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v39 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v37 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v15 = (void *)-[NSMutableArray mutableCopy](v8, "mutableCopy");
      v16 = objc_msgSend(v15, "count");
      if (v16 >= 0x64)
      {
        v17 = v16 - 1;
        do
        {
          objc_msgSend(v15, "objectAtIndex:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "recentAppLayouts:didRemoveAppLayoutForFallingOffList:", self, v18);
          objc_msgSend(v15, "removeObjectAtIndex:", v17);
          objc_msgSend(v14, "addIndex:", v17);

          --v17;
        }
        while (v17 > 0x62);
      }
      objc_msgSend(v10, "allItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_3;
      v42[3] = &unk_1E8EC16E0;
      v10 = v10;
      v43 = v10;
      v36 = v19;
      v44 = v36;
      -[SBRecentAppLayouts _changeDescriptionForFilteringAppLayouts:withDisplayItemTest:](self, "_changeDescriptionForFilteringAppLayouts:withDisplayItemTest:", v15, v42);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("SBRecentAppLayoutsDidRemoveAtIndexesKey"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v14, "addIndexes:", v20);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addIndexes:", v21);

      }
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("SBRecentAppLayoutsDidModifyAtIndexesKey"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v39, "addIndexes:", v22);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addIndexes:", v23);

      }
      if (v13)
      {
        v24 = objc_alloc(MEMORY[0x1E0C99E60]);
        objc_msgSend(v15, "objectsAtIndexes:", v39);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v24, "initWithArray:", v25);

        v27 = objc_alloc(MEMORY[0x1E0C99E60]);
        v35 = v8;
        -[NSMutableArray objectsAtIndexes:](v8, "objectsAtIndexes:", v14);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v27, "initWithArray:", v28);

        if (objc_msgSend(v29, "containsObject:", v10))
        {
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_4;
          v40[3] = &unk_1E8E9DF78;
          v41 = v10;
          objc_msgSend(v29, "bs_filter:", v40);
          v30 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v30;
        }
        objc_msgSend(v13, "recentAppLayouts:willAddAppLayout:replacingAppLayouts:removingAppLayouts:", self, v10, v26, v29);
        v31 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v31;
        v8 = v35;
      }
      objc_msgSend(v15, "insertObject:atIndex:", v10, a4);
      objc_msgSend(v37, "addIndex:", a4);
      objc_msgSend(v39, "shiftIndexesStartingAtIndex:by:", a4, 1);
      v47[0] = CFSTR("SBRecentAppLayoutsDidInsertAtIndexesKey");
      v47[1] = CFSTR("SBRecentAppLayoutsDidModifyAtIndexesKey");
      v48[0] = v37;
      v48[1] = v39;
      v47[2] = CFSTR("SBRecentAppLayoutsDidRemoveAtIndexesKey");
      v48[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentAppLayouts _setRecents:notifyForChangeDescription:](self, "_setRecents:notifyForChangeDescription:", v15, v32);

    }
  }

}

- (SBRecentAppLayoutsDelegate)delegate
{
  return (SBRecentAppLayoutsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setRecents:(id)a3 notifyForChangeDescription:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *allRecents;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  SBRecentAppLayouts *v27;

  v20 = a3;
  v17 = a4;
  objc_storeStrong((id *)&self->_allRecents, a3);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  allRecents = self->_allRecents;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__SBRecentAppLayouts__setRecents_notifyForChangeDescription___block_invoke;
  v21[3] = &unk_1E8EC1668;
  v19 = v7;
  v22 = v19;
  v18 = v10;
  v23 = v18;
  v13 = v11;
  v24 = v13;
  v14 = v8;
  v25 = v14;
  v15 = v9;
  v26 = v15;
  v27 = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](allRecents, "enumerateObjectsUsingBlock:", v21);
  objc_storeStrong((id *)&self->_unhiddenRecents, v7);
  objc_storeStrong((id *)&self->_allRecentsForBundleIdentifiers, v8);
  objc_storeStrong((id *)&self->_unhiddenRecentsForBundleIdentifiers, v9);
  objc_storeStrong((id *)&self->_allRecentDisplayItemsForBundleIdentifiers, v10);
  objc_storeStrong((id *)&self->_unhiddenRecentDisplayItemsForBundleIdentifiers, v11);
  -[SBRecentAppLayouts _saveRecents](self, "_saveRecents");
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("SBRecentAppLayoutsDidChangeNotification"), self, v17);

  }
}

- (void)_saveRecents
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_allRecents;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "appLayoutWithItemsPassingTest:", &__block_literal_global_408, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[SBRecentAppLayouts _nonPreferredDisplayItemLayoutAttributesMapForAppLayout:](self, "_nonPreferredDisplayItemLayoutAttributesMapForAppLayout:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setCachedDisplayItemLayoutAttributesForNonPreferredDisplay:", v11);
          objc_msgSend(v3, "addObject:", v10);
          if ((v7 & 1) != 0)
            v7 = 1;
          else
            v7 = objc_msgSend(v10, "isHidden") ^ 1;

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  -[SBRecentAppLayoutsPersister setRecents:](self->_persister, "setRecents:", v3);
  if ((v7 & 1) == 0)
    -[SBRecentAppLayoutsPersister syncToDiskSoonIfDirty](self->_persister, "syncToDiskSoonIfDirty");

}

- (id)_nonPreferredDisplayItemLayoutAttributesMapForAppLayout:(id)a3
{
  id v4;
  _SBDisplayItemLayoutAttributesMapKey *v5;
  void *v6;

  v4 = a3;
  v5 = -[_SBDisplayItemLayoutAttributesMapKey initWithAppLayout:displayOrdinal:]([_SBDisplayItemLayoutAttributesMapKey alloc], "initWithAppLayout:displayOrdinal:", v4, -[SBRecentAppLayouts _nonPreferredDisplayOrdinalForAppLayout:](self, "_nonPreferredDisplayOrdinalForAppLayout:", v4));

  -[NSMapTable objectForKey:](self->_layoutAttributesMapsByKey, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)noteDisplayItemLayoutAttributesMapChangedForAppLayout:(id)a3 displayOrdinal:(int64_t)a4
{
  _SBDisplayItemLayoutAttributesMapKey *v7;
  NSMapTable *layoutAttributesMapsByKey;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRecentAppLayouts.m"), 546, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

  }
  v7 = -[_SBDisplayItemLayoutAttributesMapKey initWithAppLayout:displayOrdinal:]([_SBDisplayItemLayoutAttributesMapKey alloc], "initWithAppLayout:displayOrdinal:", v11, a4);
  layoutAttributesMapsByKey = self->_layoutAttributesMapsByKey;
  objc_msgSend(v11, "itemsToLayoutAttributesMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](layoutAttributesMapsByKey, "setObject:forKey:", v9, v7);

}

- (int64_t)_nonPreferredDisplayOrdinalForAppLayout:(id)a3
{
  return objc_msgSend(a3, "preferredDisplayOrdinal") == 0;
}

- (id)_changeDescriptionForFilteringAppLayouts:(id)a3 withDisplayItemTest:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  SBRecentAppLayouts *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __83__SBRecentAppLayouts__changeDescriptionForFilteringAppLayouts_withDisplayItemTest___block_invoke;
  v19 = &unk_1E8EC16B8;
  v23 = v6;
  v24 = v7;
  v20 = self;
  v21 = v8;
  v22 = v9;
  v10 = v6;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v16);
  objc_msgSend(v10, "removeObjectsAtIndexes:", v12, v16, v17, v18, v19, v20);
  v25[0] = CFSTR("SBRecentAppLayoutsDidModifyAtIndexesKey");
  v25[1] = CFSTR("SBRecentAppLayoutsDidRemoveAtIndexesKey");
  v26[0] = v11;
  v26[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __61__SBRecentAppLayouts__setRecents_notifyForChangeDescription___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  _SBDisplayItemLayoutAttributesMapKey *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _SBDisplayItemLayoutAttributesMapKey *v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isHidden") & 1) == 0)
    objc_msgSend(a1[4], "addObject:", v3);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v3, "allItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);
        objc_msgSend(a1[5], "objectForKey:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "objectForKey:", v10);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v11 = objc_alloc_init(MEMORY[0x1E0C99E10]);
          objc_msgSend(a1[5], "setObject:forKey:", v11, v10);
        }
        objc_msgSend(v11, "addObject:", v9);
        if ((objc_msgSend(v3, "isHidden") & 1) == 0)
        {
          if (!v12)
          {
            v12 = objc_alloc_init(MEMORY[0x1E0C99E10]);
            objc_msgSend(a1[6], "setObject:forKey:", v12, v10);
          }
          objc_msgSend(v12, "addObject:", v9);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v6);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(a1[7], "objectForKey:", v18);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[8], "objectForKey:", v18);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(a1[7], "setObject:forKey:", v19, v18);
        }
        objc_msgSend(v19, "addObject:", v3);
        if ((objc_msgSend(v3, "isHidden") & 1) == 0)
        {
          if (!v20)
          {
            v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(a1[8], "setObject:forKey:", v20, v18);
          }
          objc_msgSend(v20, "addObject:", v3);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v23 = -[_SBDisplayItemLayoutAttributesMapKey initWithAppLayout:displayOrdinal:]([_SBDisplayItemLayoutAttributesMapKey alloc], "initWithAppLayout:displayOrdinal:", v3, objc_msgSend(v3, "preferredDisplayOrdinal"));
    objc_msgSend(*((id *)a1[9] + 8), "objectForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v25 = (void *)*((_QWORD *)a1[9] + 8);
      objc_msgSend(v3, "itemsToLayoutAttributesMap");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKey:", v26, v23);

    }
    objc_msgSend(v3, "cachedDisplayItemLayoutAttributesForNonPreferredDisplay");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = -[_SBDisplayItemLayoutAttributesMapKey initWithAppLayout:displayOrdinal:]([_SBDisplayItemLayoutAttributesMapKey alloc], "initWithAppLayout:displayOrdinal:", v3, objc_msgSend(a1[9], "_nonPreferredDisplayOrdinalForAppLayout:", v3));

      objc_msgSend(*((id *)a1[9] + 8), "objectForKey:", v28);
      v29 = objc_claimAutoreleasedReturnValue();

      if (!v29)
        objc_msgSend(*((id *)a1[9] + 8), "setObject:forKey:", v27, v28);
      objc_msgSend(v3, "setCachedDisplayItemLayoutAttributesForNonPreferredDisplay:", 0);
      v24 = (void *)v29;
    }
    else
    {
      v28 = v23;
    }

  }
}

uint64_t __83__SBRecentAppLayouts__changeDescriptionForFilteringAppLayouts_withDisplayItemTest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

void __83__SBRecentAppLayouts__changeDescriptionForFilteringAppLayouts_withDisplayItemTest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  BOOL v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__SBRecentAppLayouts__changeDescriptionForFilteringAppLayouts_withDisplayItemTest___block_invoke_2;
  v11[3] = &unk_1E8EC1690;
  v13 = *(id *)(a1 + 64);
  v12 = v5;
  v10 = v12;
  objc_msgSend(v12, "appLayoutWithItemsPassingTest:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  if (WeakRetained)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    if ((objc_msgSend(v6, "isEqual:", v10) & 1) != 0)
      goto LABEL_8;
    objc_msgSend(WeakRetained, "recentAppLayouts:willReplaceAppLayout:proposedReplacementAppLayout:", *(_QWORD *)(a1 + 32), v10, v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    goto LABEL_11;
  }
LABEL_8:
  if ((objc_msgSend(v10, "isEqual:", v6) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", a3 - objc_msgSend(*(id *)(a1 + 40), "count"));
    objc_msgSend(*(id *)(a1 + 56), "replaceObjectAtIndex:withObject:", a3, v6);
  }
LABEL_11:

}

uint64_t __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "environment") == 1 && objc_msgSend(*(id *)(a1 + 40), "count") == 1)
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5);
    if ((objc_msgSend(v6, "isHidden") & 1) == 0)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "environment");
      if (v8 != objc_msgSend(v6, "environment"))
        v7 = 0;
    }
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5);
  }

  return v7 ^ 1u;
}

- (SBRecentAppLayouts)initWithUserDefaults:(id)a3 persister:(id)a4 iconController:(id)a5 applicationController:(id)a6 placeholderController:(id)a7 sceneManager:(id)a8
{
  id v16;
  id v17;
  SBRecentAppLayouts *v18;
  NSMapTable *v19;
  NSMapTable *layoutAttributesMapsByKey;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  BSInvalidatable *stateCaptureInvalidatable;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id location;
  objc_super v38;

  v16 = a3;
  v35 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  v17 = a8;
  v38.receiver = self;
  v38.super_class = (Class)SBRecentAppLayouts;
  v18 = -[SBRecentAppLayouts init](&v38, sel_init);
  if (v18)
  {
    kdebug_trace();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("SBRecentAppLayouts.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("defaults"));

    }
    objc_storeStrong((id *)&v18->_defaults, a3);
    objc_storeStrong((id *)&v18->_iconController, a5);
    objc_storeStrong((id *)&v18->_applicationController, a6);
    objc_storeStrong((id *)&v18->_placeholderController, a7);
    objc_storeStrong((id *)&v18->_sceneManager, a8);
    objc_storeStrong((id *)&v18->_persister, a4);
    v19 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E0CB3748]);
    layoutAttributesMapsByKey = v18->_layoutAttributesMapsByKey;
    v18->_layoutAttributesMapsByKey = v19;

    -[SBRecentAppLayouts _initializeRecents](v18, "_initializeRecents");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0DAAA10];
    -[SBIconController model](v18->_iconController, "model");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v18, sel__iconVisibilityDidChange_, v22, v23);

    -[SBApplicationController restrictionController](v18->_applicationController, "restrictionController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:", v18);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v18, sel__installedApplicationsDidChange_, CFSTR("SBInstalledApplicationsDidChangeNotification"), v18->_applicationController);

    -[SBAppSwitcherDefaults clearLegacyDefaults](v18->_defaults, "clearLegacyDefaults");
    -[SBRecentAppLayouts _setUpStashedModelSettingsOutlets](v18, "_setUpStashedModelSettingsOutlets");
    objc_initWeak(&location, v18);
    v26 = MEMORY[0x1E0C80D38];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SpringBoard - SBRecentAppLayouts - %@"), v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v36, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v28 = objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = v18->_stateCaptureInvalidatable;
    v18->_stateCaptureInvalidatable = (BSInvalidatable *)v28;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v18;
}

id __125__SBRecentAppLayouts_initWithUserDefaults_persister_iconController_applicationController_placeholderController_sceneManager___block_invoke(uint64_t a1)
{
  const __CFString **WeakRetained;
  const __CFString **v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = (const __CFString **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    if (!v3)
      v3 = CFSTR("<nil>");
    v8[0] = CFSTR("recents");
    v8[1] = CFSTR("recents by bundle IDs");
    v4 = WeakRetained[3];
    if (!v4)
      v4 = CFSTR("<nil>");
    v9[0] = v3;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SBRecentAppLayouts)init
{
  void *v3;
  void *v4;
  SBRecentAppLayoutsPersister *v5;
  SBRecentAppLayoutsPersister *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBRecentAppLayouts *v11;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appSwitcherDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [SBRecentAppLayoutsPersister alloc];
  if (SBRecentAppLayoutsPersistenceURL___onceToken != -1)
    dispatch_once(&SBRecentAppLayoutsPersistenceURL___onceToken, &__block_literal_global_258);
  v6 = -[SBRecentAppLayoutsPersister initWithPersistenceURL:](v5, "initWithPersistenceURL:", SBRecentAppLayoutsPersistenceURL___persistenceURL);
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBRecentAppLayouts initWithUserDefaults:persister:iconController:applicationController:placeholderController:sceneManager:](self, "initWithUserDefaults:persister:iconController:applicationController:placeholderController:sceneManager:", v4, v6, v7, v8, v9, v10);

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBApplicationController restrictionController](self->_applicationController, "restrictionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SBRecentAppLayouts;
  -[SBRecentAppLayouts dealloc](&v4, sel_dealloc);
}

- (void)_initializeRecents
{
  void *v3;
  id v4;
  id v5;

  if (-[SBRecentAppLayoutsPersister initializedNewStoreOnDisk](self->_persister, "initializedNewStoreOnDisk"))
    -[SBRecentAppLayouts _recentsFromPrefs](self, "_recentsFromPrefs");
  else
    -[SBRecentAppLayoutsPersister recents](self->_persister, "recents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "mutableCopy");

  -[SBRecentAppLayouts _validateAndUpdateRecents:](self, "_validateAndUpdateRecents:", v5);
  v4 = -[SBRecentAppLayouts _changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts:](self, "_changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts:", v5);
  -[SBRecentAppLayouts _setRecents:notifyForChangeDescription:](self, "_setRecents:notifyForChangeDescription:", v5, 0);

}

- (void)_persistSoon
{
  -[SBRecentAppLayoutsPersister syncToDiskSoonIfDirty](self->_persister, "syncToDiskSoonIfDirty");
}

- (void)_persistSynchronously
{
  -[SBRecentAppLayoutsPersister syncToDiskSynchronously](self->_persister, "syncToDiskSynchronously");
}

uint64_t __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

- (void)addAppLayout:(id)a3 afterAppLayout:(id)a4
{
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = -[NSMutableArray indexOfObject:](self->_allRecents, "indexOfObject:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRecentAppLayouts.m"), 480, CFSTR("App layout not found"));

  }
  -[SBRecentAppLayouts addAppLayout:atIndex:](self, "addAppLayout:atIndex:", v9, v7 + 1);

}

- (void)replaceAppLayout:(id)a3 withAppLayout:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRecentAppLayouts.m"), 485, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inNewAppLayout != nil"));

  }
  if (objc_msgSend(v8, "type"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRecentAppLayouts.m"), 486, CFSTR("Only Apps may be added to app switcher model"));

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53__SBRecentAppLayouts_replaceAppLayout_withAppLayout___block_invoke;
  v19[3] = &unk_1E8E9DF50;
  v19[4] = self;
  objc_msgSend(v8, "appLayoutWithItemsPassingTest:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_allRecents;
  v11 = v10;
  if (v10)
  {
    v12 = -[NSMutableArray indexOfObject:](v10, "indexOfObject:", v7);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = v12;
      v14 = (void *)-[NSMutableArray mutableCopy](v11, "mutableCopy");
      objc_msgSend(v14, "replaceObjectAtIndex:withObject:", v13, v9);
      v20 = CFSTR("SBRecentAppLayoutsDidModifyAtIndexesKey");
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentAppLayouts _setRecents:notifyForChangeDescription:](self, "_setRecents:notifyForChangeDescription:", v14, v16);

    }
  }

}

uint64_t __53__SBRecentAppLayouts_replaceAppLayout_withAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isDisplayItemRestrictedOrUnsupported:", a2) ^ 1;
}

- (void)remove:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBRecentAppLayouts removeAppLayouts:](self, "removeAppLayouts:", v6, v7, v8);
}

- (void)removeAppLayouts:(id)a3
{
  NSMutableArray *allRecents;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  allRecents = self->_allRecents;
  v5 = a3;
  v11 = (id)-[NSMutableArray mutableCopy](allRecents, "mutableCopy");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__SBRecentAppLayouts_removeAppLayouts___block_invoke;
  v14[3] = &unk_1E8EA89A8;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __39__SBRecentAppLayouts_removeAppLayouts___block_invoke_2;
  v12[3] = &unk_1E8EC1708;
  v13 = v8;
  v9 = v8;
  -[SBRecentAppLayouts _changeDescriptionForFilteringAppLayouts:withDisplayItemTest:](self, "_changeDescriptionForFilteringAppLayouts:withDisplayItemTest:", v11, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRecentAppLayouts _setRecents:notifyForChangeDescription:](self, "_setRecents:notifyForChangeDescription:", v11, v10);

}

void __39__SBRecentAppLayouts_removeAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

uint64_t __39__SBRecentAppLayouts_removeAppLayouts___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)hide:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "appLayoutByModifyingHiddenState:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBRecentAppLayouts remove:](self, "remove:", v4);

  -[SBRecentAppLayouts addToFront:](self, "addToFront:", v5);
}

- (id)bestLastDisplayItemLayoutAttributesMapForAppLayout:(id)a3 displayOrdinal:(int64_t)a4
{
  id v7;
  _SBDisplayItemLayoutAttributesMapKey *v8;
  void *v9;
  void *v11;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRecentAppLayouts.m"), 552, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

  }
  v8 = -[_SBDisplayItemLayoutAttributesMapKey initWithAppLayout:displayOrdinal:]([_SBDisplayItemLayoutAttributesMapKey alloc], "initWithAppLayout:displayOrdinal:", v7, a4);
  -[NSMapTable objectForKey:](self->_layoutAttributesMapsByKey, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v7, "itemsToLayoutAttributesMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_legacyAppLayoutForItem:(id)a3 layoutRole:(int64_t)a4
{
  id v5;
  SBAppLayout *v6;
  void *v7;
  void *v8;
  SBAppLayout *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = [SBAppLayout alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v6, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v8, 1, 1, 0);
  return v9;
}

- (id)_legacyAppLayoutsForDisplayItems:(id)a3 layoutRolesMapping:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__SBRecentAppLayouts__legacyAppLayoutsForDisplayItems_layoutRolesMapping___block_invoke;
  v10[3] = &unk_1E8EBD988;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a3, "bs_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __74__SBRecentAppLayouts__legacyAppLayoutsForDisplayItems_layoutRolesMapping___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_legacyAppLayoutForItem:layoutRole:", v4, objc_msgSend(v5, "unsignedIntegerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_recentsFromPrefs
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;

  -[SBAppSwitcherDefaults recentsPlistRepresentation](self->_defaults, "recentsPlistRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "bs_map:", &__block_literal_global_72_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "containsObject:", v9),
        v9,
        v10))
  {
    -[SBRecentAppLayouts _recentDisplayItemsFromLegacyPrefs](self, "_recentDisplayItemsFromLegacyPrefs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRecentAppLayouts _displayItemLayoutRolesFromLegacyPrefsForLoadedDisplayItems:](self, "_displayItemLayoutRolesFromLegacyPrefsForLoadedDisplayItems:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRecentAppLayouts _legacyAppLayoutsForDisplayItems:layoutRolesMapping:](self, "_legacyAppLayoutsForDisplayItems:layoutRolesMapping:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }
  return v8;
}

SBAppLayout *__39__SBRecentAppLayouts__recentsFromPrefs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SBAppLayout *v3;

  v2 = a2;
  v3 = -[SBAppLayout initWithPlistRepresentation:]([SBAppLayout alloc], "initWithPlistRepresentation:", v2);

  return v3;
}

- (id)_recentDisplayItemsFromLegacyPrefs
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SBDisplayItem *v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SBAppSwitcherDefaults legacyRecentDisplayItems](self->_defaults, "legacyRecentDisplayItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = -[SBDisplayItem initWithLegacyPlistRepresentation:]([SBDisplayItem alloc], "initWithLegacyPlistRepresentation:", v9);
        if (v10)
        {
          objc_msgSend(v3, "addObject:", v10);
        }
        else
        {
          SBLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v18 = v9;
            _os_log_error_impl(&dword_1D0540000, v11, OS_LOG_TYPE_ERROR, "bad app layout found in persistent storage, item=%{public}@", buf, 0xCu);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_displayItemLayoutRolesFromLegacyPrefsForLoadedDisplayItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBAppSwitcherDefaults legacyRecentDisplayItemRoles](self->_defaults, "legacyRecentDisplayItemRoles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_map:", &__block_literal_global_75_3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7 == objc_msgSend(v4, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjects:forKeys:", v6, v4);
  }
  else
  {
    v17 = v6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v15, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v6 = v17;
  }

  return v8;
}

uint64_t __82__SBRecentAppLayouts__displayItemLayoutRolesFromLegacyPrefsForLoadedDisplayItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = objc_msgSend(a2, "integerValue");
  v4 = &SBLayoutRolePrimary;
  v5 = &SBLayoutRoleSide;
  if (v3 != 3)
    v5 = &SBLayoutRoleUndefined;
  if (v3 != 2)
    v4 = v5;
  return objc_msgSend(v2, "numberWithInteger:", *v4);
}

- (void)_validateAndUpdateRecents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[9];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[5];
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__130;
  v43[4] = __Block_byref_object_dispose__130;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__130;
  v41 = __Block_byref_object_dispose__130;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__130;
  v35 = __Block_byref_object_dispose__130;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__130;
  v29 = __Block_byref_object_dispose__130;
  v30 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke;
  v24[3] = &unk_1E8EC1800;
  v24[4] = self;
  v24[5] = v43;
  v24[6] = &v37;
  v24[7] = &v31;
  v24[8] = &v25;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v38[5], "count"))
    objc_msgSend(v4, "replaceObjectsAtIndexes:withObjects:", v38[5], v32[5]);
  if (objc_msgSend(v14, "count"))
    objc_msgSend(v4, "removeObjectsAtIndexes:", v14);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)v26[5];
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v46, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v9 = objc_msgSend(v4, "indexOfObject:", v8);
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v4, "removeObject:", v8);
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          objc_msgSend((id)v26[5], "objectForKey:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v45, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v17;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v17 != v12)
                  objc_enumerationMutation(v10);
                objc_msgSend(v4, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), v9 + j);
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v45, 16);
              v9 += j;
            }
            while (v11);
          }

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v46, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v43, 8);

}

BOOL __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  _BOOL8 v11;
  id v12;
  uint64_t v13;
  SBAppLayout *v14;
  SBAppLayout *v15;
  SBAppLayout *v16;
  SBAppLayout *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, void *, _BYTE *);
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;

  v5 = a2;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__130;
  v45 = __Block_byref_object_dispose__130;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemForLayoutRole:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "itemForLayoutRole:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      *((_BYTE *)v52 + 24) = 1;
  }
  objc_msgSend(v5, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 1)
  {
    v9 = objc_msgSend(v5, "configuration");

    v10 = v52;
    if (v9 != 1)
      *((_BYTE *)v52 + 24) = 1;
  }
  else
  {

    v10 = v52;
  }
  if (*((_BYTE *)v10 + 24))
  {
    v11 = 1;
  }
  else
  {
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2;
    v34 = &unk_1E8EC17D8;
    v35 = a1[4];
    v37 = &v51;
    v12 = v5;
    v13 = a1[5];
    v36 = v12;
    v38 = v13;
    v39 = &v47;
    v40 = &v41;
    objc_msgSend(v12, "enumerate:", &v31);
    v14 = (SBAppLayout *)v12;
    v15 = v14;
    if (*((_BYTE *)v48 + 24))
    {
      v16 = [SBAppLayout alloc];
      v17 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v16, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v42[5], -[SBAppLayout configuration](v15, "configuration", v31, v32, v33, v34, v35), -[SBAppLayout environment](v15, "environment"), -[SBAppLayout preferredDisplayOrdinal](v15, "preferredDisplayOrdinal"));

      v18 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      if (v18)
      {
        objc_msgSend(v18, "addIndex:", a3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a3);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1[6] + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v17);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1[7] + 8);
        v24 = *(void **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v22;

      }
    }
    else
    {
      v17 = v14;
    }
    if (!*((_BYTE *)v52 + 24) && (SBFIsChamoisWindowingUIAvailable() & 1) == 0)
    {
      -[SBAppLayout appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:multitaskingSupported:](v17, "appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:multitaskingSupported:", *(_QWORD *)(a1[4] + 88), objc_msgSend(*(id *)(a1[4] + 72), "medusaMultitaskingEnabled"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = *(_QWORD *)(a1[8] + 8);
          v29 = *(void **)(v28 + 40);
          *(_QWORD *)(v28 + 40) = v27;

          v26 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
        }
        objc_msgSend(v26, "setObject:forKey:", v25, v17, v31, v32, v33, v34, v35);
      }

    }
    v11 = *((_BYTE *)v52 + 24) != 0;
  }
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v11;
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  _BOOL4 IsValid;
  NSObject *v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  char v22;
  NSObject *v23;
  char v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;

  v7 = a3;
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "applicationWithBundleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_5();

  }
  objc_msgSend(v9, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSignatureVersionSupported");

  if ((v12 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    SBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_4();

  }
  v14 = *(_QWORD *)(a1 + 48);
  if (!*(_BYTE *)(*(_QWORD *)(v14 + 8) + 24))
  {
    IsValid = SBLayoutRoleIsValid(a2);
    v14 = *(_QWORD *)(a1 + 48);
    if (!IsValid || a2 == 3)
    {
      *(_BYTE *)(*(_QWORD *)(v14 + 8) + 24) = 1;
      SBLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_3();

      *a4 = 1;
      v14 = *(_QWORD *)(a1 + 48);
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(v14 + 8) + 24))
  {
    v17 = v9;
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
LABEL_18:
        objc_msgSend(v17, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.webapp"));
LABEL_21:
        v22 = v19;

        if ((v22 & 1) == 0)
        {
          if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containsObject:", v8))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            *a4 = 1;
            SBLogCommon();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_2();

          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v8);
          }
        }
        v24 = objc_msgSend(*(id *)(a1 + 32), "_isExistingSceneIdentifierValidForClaimedMultiwindowSupportInDisplayItem:", v7);
        v14 = *(_QWORD *)(a1 + 48);
        if ((v24 & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(v14 + 8) + 24) = 1;
          *a4 = 1;
          SBLogCommon();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_1();

          v14 = *(_QWORD *)(a1 + 48);
        }
        goto LABEL_31;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "userInterfaceIdiom");

      if (v21 != 1)
        goto LABEL_18;
    }
    objc_msgSend(v17, "info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "supportsMultiwindow");
    goto LABEL_21;
  }
LABEL_31:
  if (!*(_BYTE *)(*(_QWORD *)(v14 + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_migrateDisplayItemIfNeeded:", v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v27;
      v30 = v26;
    }
    else
    {
      v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v31;
      v30 = v7;
    }
    objc_msgSend(v29, "setObject:forKey:", v30, v28);

  }
}

- (BOOL)_isExistingSceneIdentifierValidForClaimedMultiwindowSupportInDisplayItem:(id)a3
{
  SBApplicationController *applicationController;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int v9;
  void *v10;
  int v11;

  applicationController = self->_applicationController;
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationController applicationWithBundleIdentifier:](applicationController, "applicationWithBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (v8 = objc_msgSend(v7, "length"), v8 >= objc_msgSend(CFSTR("default"), "length")))
  {
    objc_msgSend(v6, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportsMultiwindow");

    v9 = v11 ^ objc_msgSend(v7, "hasSuffix:", CFSTR("default"));
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)_setUpStashedModelSettingsOutlets
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearModelOutlet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke;
  v19[3] = &unk_1E8E9DED8;
  v19[4] = self;
  v6 = (id)objc_msgSend(v4, "addAction:", v19);

  objc_msgSend(v3, "stashModelOutlet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_2;
  v18[3] = &unk_1E8E9DED8;
  v18[4] = self;
  v8 = (id)objc_msgSend(v7, "addAction:", v18);

  objc_msgSend(v3, "loadModelOutlet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_3;
  v17[3] = &unk_1E8E9DED8;
  v17[4] = self;
  v10 = (id)objc_msgSend(v9, "addAction:", v17);

  objc_msgSend(v3, "addAppsToModelOutlet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_4;
  v16[3] = &unk_1E8E9DED8;
  v16[4] = self;
  v12 = (id)objc_msgSend(v11, "addAction:", v16);

  objc_msgSend(v3, "addPPTAppsToModelOutlet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_5;
  v15[3] = &unk_1E8E9DED8;
  v15[4] = self;
  v14 = (id)objc_msgSend(v13, "addAction:", v15);

}

uint64_t __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAppLayouts:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  SBStashedModelPath();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_stashModelToPath:", v2);

}

void __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  SBStashedModelPath();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_loadStashedModelAtPath:", v2);

}

uint64_t __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addAllAppsToModel");
}

id __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_5(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_ppt_loadStashedModel");
}

- (BOOL)_stashModelToPath:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_allRecents;
  -[NSMutableArray bs_map:](v5, "bs_map:", &__block_literal_global_80_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 100, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = objc_msgSend(v7, "writeToFile:options:error:", v4, 1, &v14);
  v9 = v14;
  if ((v8 & 1) == 0)
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(v7, "length");
      objc_msgSend(v9, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v16 = v12;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v13;
      _os_log_error_impl(&dword_1D0540000, v10, OS_LOG_TYPE_ERROR, "Error writing data (len=%lu) to %@: %@", buf, 0x20u);

    }
  }

  return v8;
}

uint64_t __40__SBRecentAppLayouts__stashModelToPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "plistRepresentation");
}

- (BOOL)_loadStashedModelAtPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5
      && (objc_msgSend(v5, "bs_map:", &__block_literal_global_84_2), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (void *)v7;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = (void *)-[NSMutableArray copy](self->_allRecents, "copy");
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v9);
            -[SBRecentAppLayouts remove:](self, "remove:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v11);
      }

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v8, "reverseObjectEnumerator", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            -[SBRecentAppLayouts addToFront:](self, "addToFront:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v16);
      }

      v19 = 1;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

SBAppLayout *__46__SBRecentAppLayouts__loadStashedModelAtPath___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SBAppLayout *v3;

  v2 = a2;
  v3 = -[SBAppLayout initWithPlistRepresentation:]([SBAppLayout alloc], "initWithPlistRepresentation:", v2);

  return v3;
}

- (void)_addAllAppsToModel
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  SBAppLayout *v8;
  void *v9;
  void *v10;
  SBAppLayout *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allBundleIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 0, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6), 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = [SBAppLayout alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v9;
        v19 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v8, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v10, 1, 1, 0);

        -[SBRecentAppLayouts addToFront:](self, "addToFront:", v11);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v4);
  }

}

- (id)_ppt_loadStashedModel
{
  void *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;

  -[SBRecentAppLayouts _ppt_currentModel](self, "_ppt_currentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (__sb__runningInSpringBoard())
  {
    v4 = SBFEffectiveDeviceClass();
    v5 = CFSTR("_internal_iPhonePPTSwitcherModel");
    if (v4 == 2)
      v5 = CFSTR("_internal_iPadPPTSwitcherModel");
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");
    v9 = CFSTR("_internal_iPhonePPTSwitcherModel");
    if (v8 == 1)
      v9 = CFSTR("_internal_iPadPPTSwitcherModel");
    v6 = v9;

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathForResource:ofType:", v6, CFSTR("plist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBRecentAppLayouts _loadStashedModelAtPath:](self, "_loadStashedModelAtPath:", v11);
  return v3;
}

- (id)_ppt_currentModel
{
  return (id)-[NSMutableArray copy](self->_allRecents, "copy");
}

- (void)_ppt_setModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[SBRecentAppLayouts _ppt_currentModel](self, "_ppt_currentModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          -[SBRecentAppLayouts remove:](self, "remove:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "reverseObjectEnumerator", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          -[SBRecentAppLayouts addToFront:](self, "addToFront:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }

  }
}

- (id)_acquireAllowHiddenAppAssertionForBundleIdentifier:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogAppSwitcher();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v24 = v6;
    v25 = 2114;
    v26 = v7;
    v27 = 2114;
    v28 = v9;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Acquiring visibility assertion of %{public}@ for %{public}@ identifier %{public}@", buf, 0x20u);
  }

  v11 = objc_alloc(MEMORY[0x1E0D01868]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__SBRecentAppLayouts__acquireAllowHiddenAppAssertionForBundleIdentifier_reason___block_invoke;
  v17[3] = &unk_1E8EB2468;
  objc_copyWeak(&v21, &location);
  v12 = v6;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v14 = v7;
  v20 = v14;
  v15 = (void *)objc_msgSend(v11, "initWithIdentifier:forReason:invalidationBlock:", v13, v14, v17);
  -[SBRecentAppLayouts _addAllowHiddenAppAssertionForBundleIdentifier:requestIdentifier:](self, "_addAllowHiddenAppAssertionForBundleIdentifier:requestIdentifier:", v12, v13);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v15;
}

void __80__SBRecentAppLayouts__acquireAllowHiddenAppAssertionForBundleIdentifier_reason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_removeAllowHiddenAppAssertionForBundleIdentifier:requestIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  SBLogAppSwitcher();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543874;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Invalidated visibility assertion of %{public}@ for %{public}@ identifier %{public}@", (uint8_t *)&v7, 0x20u);
  }

}

- (void)_addAllowHiddenAppAssertionForBundleIdentifier:(id)a3 requestIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *allowHiddenAppAssertions;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  allowHiddenAppAssertions = self->_allowHiddenAppAssertions;
  if (!allowHiddenAppAssertions)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_allowHiddenAppAssertions;
    self->_allowHiddenAppAssertions = v8;

    allowHiddenAppAssertions = self->_allowHiddenAppAssertions;
  }
  -[NSMutableDictionary objectForKey:](allowHiddenAppAssertions, "objectForKey:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_allowHiddenAppAssertions, "setObject:forKey:", v10, v11);
  }
  objc_msgSend(v10, "addObject:", v6);
  -[SBRecentAppLayouts _filterRestrictedOrUnsupportedAppsFromRecents](self, "_filterRestrictedOrUnsupportedAppsFromRecents");

}

- (void)_removeAllowHiddenAppAssertionForBundleIdentifier:(id)a3 requestIdentifier:(id)a4
{
  NSMutableDictionary *allowHiddenAppAssertions;
  id v7;
  id v8;

  allowHiddenAppAssertions = self->_allowHiddenAppAssertions;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](allowHiddenAppAssertions, "objectForKey:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  -[SBRecentAppLayouts _filterRestrictedOrUnsupportedAppsFromRecents](self, "_filterRestrictedOrUnsupportedAppsFromRecents");
}

- (id)_changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __94__SBRecentAppLayouts__changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts___block_invoke;
  v4[3] = &unk_1E8EC1708;
  v4[4] = self;
  -[SBRecentAppLayouts _changeDescriptionForFilteringAppLayouts:withDisplayItemTest:](self, "_changeDescriptionForFilteringAppLayouts:withDisplayItemTest:", a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __94__SBRecentAppLayouts__changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isDisplayItemRestrictedOrUnsupported:", a2) ^ 1;
}

- (void)_filterRestrictedOrUnsupportedAppsFromRecents
{
  void *v3;
  id v4;

  v4 = (id)-[NSMutableArray mutableCopy](self->_allRecents, "mutableCopy");
  -[SBRecentAppLayouts _changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts:](self, "_changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRecentAppLayouts _setRecents:notifyForChangeDescription:](self, "_setRecents:notifyForChangeDescription:", v4, v3);

}

- (id)_changeDescriptionForFilteringRestrictedUnsupportedAndInvalidAppsFromAppLayouts:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __102__SBRecentAppLayouts__changeDescriptionForFilteringRestrictedUnsupportedAndInvalidAppsFromAppLayouts___block_invoke;
  v4[3] = &unk_1E8EC1708;
  v4[4] = self;
  -[SBRecentAppLayouts _changeDescriptionForFilteringAppLayouts:withDisplayItemTest:](self, "_changeDescriptionForFilteringAppLayouts:withDisplayItemTest:", a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __102__SBRecentAppLayouts__changeDescriptionForFilteringRestrictedUnsupportedAndInvalidAppsFromAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDisplayItemRestrictedOrUnsupported:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "_isExistingSceneIdentifierValidForClaimedMultiwindowSupportInDisplayItem:", v3);

  return v4;
}

- (void)_filterRestrictedUnsupportedAndInvalidAppsFromRecents
{
  void *v3;
  void *v4;
  id v5;

  -[SBRecentAppLayouts recentsIncludingHiddenAppLayouts:](self, "recentsIncludingHiddenAppLayouts:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "mutableCopy");

  -[SBRecentAppLayouts _changeDescriptionForFilteringRestrictedUnsupportedAndInvalidAppsFromAppLayouts:](self, "_changeDescriptionForFilteringRestrictedUnsupportedAndInvalidAppsFromAppLayouts:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRecentAppLayouts _setRecents:notifyForChangeDescription:](self, "_setRecents:notifyForChangeDescription:", v5, v4);

}

+ (id)allowedHiddenApplicationBundleIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.BarcodeScanner");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_migrateDisplayItemIfNeeded:(id)a3
{
  id v4;
  void *v5;
  SBDisplayItem *v6;
  SBApplicationController *applicationController;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  SBDisplayItem *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") && objc_msgSend(v4, "type") != 5
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("sceneID")) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    applicationController = self->_applicationController;
    objc_msgSend(v4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationController applicationWithBundleIdentifier:](applicationController, "applicationWithBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_dataStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBSceneManager newSceneIdentityForApplication:](self->_sceneManager, "newSceneIdentityForApplication:", v9);
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "sceneStoreForIdentifier:creatingIfNecessary:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sceneStoreForIdentifier:creatingIfNecessary:", v5, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __50__SBRecentAppLayouts__migrateDisplayItemIfNeeded___block_invoke;
    v21[3] = &unk_1E8EA3160;
    v22 = v13;
    v16 = v13;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v21);

    objc_msgSend(v16, "setObject:forKey:", v5, CFSTR("persistenceIdentifier"));
    objc_msgSend(v10, "removeSceneStoreForIdentifier:", v5);
    v17 = [SBDisplayItem alloc];
    v18 = objc_msgSend(v4, "type");
    objc_msgSend(v4, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:](v17, "initWithType:bundleIdentifier:uniqueIdentifier:", v18, v19, v12);

  }
  return v6;
}

uint64_t __50__SBRecentAppLayouts__migrateDisplayItemIfNeeded___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_persister, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_placeholderController, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_layoutAttributesMapsByKey, 0);
  objc_storeStrong((id *)&self->_allowHiddenAppAssertions, 0);
  objc_storeStrong((id *)&self->_unhiddenRecentDisplayItemsForBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allRecentDisplayItemsForBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_unhiddenRecentsForBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allRecentsForBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_unhiddenRecents, 0);
  objc_storeStrong((id *)&self->_allRecents, 0);
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_23(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "bad app layout found in persistent storage, appLayout=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_23(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "duplicate app layout for single window app found in persistent storage, appLayout=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_23(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "bad app layout found reading from SBRecentAppLayout's persistent storage. One of the roles is not recognized. appLayout=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_23(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "application signature version was no longer supported.  appLayout=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_23(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "bad app layout found in persistent storage. one of the referenced apps is not installed. appLayout=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
