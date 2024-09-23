@implementation SBUISystemApertureLayoutGuide

+ (BOOL)prepareLayoutGuidesForViewControllerIfNeeded:(id)a3 onlyIfEmpty:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[5];
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__SBUISystemApertureLayoutGuide_prepareLayoutGuidesForViewControllerIfNeeded_onlyIfEmpty___block_invoke;
  v13[3] = &unk_1E4C3F1B8;
  v14 = a4;
  v13[4] = &v15;
  objc_msgSend(a1, "_enumerateSystemApertureRootLayoutGuidesForViewController:usingBlock:", v6, v13);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __90__SBUISystemApertureLayoutGuide_prepareLayoutGuidesForViewControllerIfNeeded_onlyIfEmpty___block_invoke_2;
  v10[3] = &unk_1E4C3F1E0;
  v8 = v6;
  v11 = v8;
  v12 = &v15;
  objc_msgSend(a1, "_enumerateUnpreparedSystemApertureLayoutGuides:", v10);
  LOBYTE(a1) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)a1;
}

void __90__SBUISystemApertureLayoutGuide_prepareLayoutGuidesForViewControllerIfNeeded_onlyIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 IsEmpty;
  char v6;
  id v7;
  CGRect v8;

  v3 = a2;
  v4 = v3;
  v7 = v3;
  if (!*(_BYTE *)(a1 + 40) || (objc_msgSend(v3, "layoutFrame"), IsEmpty = CGRectIsEmpty(v8), v4 = v7, IsEmpty))
  {
    v6 = objc_msgSend(v4, "_createOrUpdateConstraintsIfIsRootAndInAWindow");
    v4 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v6;
  }

}

void __90__SBUISystemApertureLayoutGuide_prepareLayoutGuidesForViewControllerIfNeeded_onlyIfEmpty___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "owningView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isDescendantOfView:", v4);

  if (v5)
  {
    objc_msgSend(v6, "prepareIfNeeded");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v6, "_requiresInitialSetup") ^ 1;
  }

}

+ (void)_addUnpreparedLayoutGuide:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)SBUISystemApertureUnpreparedLayoutGuides;
  v7 = v3;
  if (!SBUISystemApertureUnpreparedLayoutGuides)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)SBUISystemApertureUnpreparedLayoutGuides;
    SBUISystemApertureUnpreparedLayoutGuides = v5;

    v3 = v7;
    v4 = (void *)SBUISystemApertureUnpreparedLayoutGuides;
  }
  objc_msgSend(v4, "addObject:", v3);

}

+ (void)_removeUnpreparedLayoutGuideIfNeeded:(id)a3
{
  void *v3;

  objc_msgSend((id)SBUISystemApertureUnpreparedLayoutGuides, "removeObject:", a3);
  if (!objc_msgSend((id)SBUISystemApertureUnpreparedLayoutGuides, "count"))
  {
    v3 = (void *)SBUISystemApertureUnpreparedLayoutGuides;
    SBUISystemApertureUnpreparedLayoutGuides = 0;

  }
}

+ (void)_enumerateUnpreparedSystemApertureLayoutGuides:(id)a3
{
  void (**v3)(id, _QWORD);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  objc_msgSend((id)SBUISystemApertureUnpreparedLayoutGuides, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        v3[2](v3, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (void)_enumerateSystemApertureRootLayoutGuidesForViewController:(id)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  objc_msgSend(a3, "systemApertureElementContextPrivate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutGuideRootView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "layoutGuides");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_compactMap:", &__block_literal_global_11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        v5[2](v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

id __102__SBUISystemApertureLayoutGuide__enumerateSystemApertureRootLayoutGuidesForViewController_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)prepareIfNeeded
{
  void *v3;
  void *v4;

  if (-[SBUISystemApertureLayoutGuide _requiresInitialSetup](self, "_requiresInitialSetup"))
  {
    -[SBUISystemApertureLayoutGuide owningView](self, "owningView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureLayoutGuide _rootGuideView](self, "_rootGuideView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (v3 == v4)
        -[SBUISystemApertureLayoutGuide _createOrUpdateConstraintsIfIsRootAndInAWindow](self, "_createOrUpdateConstraintsIfIsRootAndInAWindow");
      else
        -[SBUISystemApertureLayoutGuide _activateConstraintsWithRootLayoutGuide](self, "_activateConstraintsWithRootLayoutGuide");
    }

  }
  if (-[SBUISystemApertureLayoutGuide _requiresInitialSetup](self, "_requiresInitialSetup"))
    +[SBUISystemApertureLayoutGuide _addUnpreparedLayoutGuide:](SBUISystemApertureLayoutGuide, "_addUnpreparedLayoutGuide:", self);
  else
    +[SBUISystemApertureLayoutGuide _removeUnpreparedLayoutGuideIfNeeded:](SBUISystemApertureLayoutGuide, "_removeUnpreparedLayoutGuideIfNeeded:", self);
}

- (void)activateConstraintsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[SBUISystemApertureLayoutGuide owningView](self, "owningView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureLayoutGuide _rootGuideView](self, "_rootGuideView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_isInAWindow"))
  {
    if (v3)
    {
      if (!-[SBUISystemApertureLayoutGuide _requiresInitialSetup](self, "_requiresInitialSetup"))
      {
        -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "count");

        if (v5)
        {
          -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __60__SBUISystemApertureLayoutGuide_activateConstraintsIfNeeded__block_invoke;
          v9[3] = &unk_1E4C3F228;
          v9[4] = self;
          objc_msgSend(v6, "bs_filter:", v9);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v7, "count"))
            objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v7);

        }
      }
    }
  }

}

uint64_t __60__SBUISystemApertureLayoutGuide_activateConstraintsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "constraintNeedsActivation:", a2);
}

- (BOOL)constraintNeedsActivation:(id)a3
{
  id v4;
  char v5;
  SBUISystemApertureLayoutGuide *v6;
  SBUISystemApertureLayoutGuide *v7;
  SBUISystemApertureLayoutGuide *v8;
  uint64_t v9;
  SBUISystemApertureLayoutGuide *v10;
  SBUISystemApertureLayoutGuide *v11;
  SBUISystemApertureLayoutGuide *v12;
  uint64_t v13;
  SBUISystemApertureLayoutGuide *v14;
  SBUISystemApertureLayoutGuide *v15;
  SBUISystemApertureLayoutGuide *v16;
  void *v17;
  void *v18;

  v4 = a3;
  if ((objc_msgSend(v4, "isActive") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "firstItem");
    v6 = (SBUISystemApertureLayoutGuide *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "secondItem");
    v7 = (SBUISystemApertureLayoutGuide *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 != self)
    {

      if (v8 == self)
      {
        objc_msgSend(v4, "firstItem");
        v8 = (SBUISystemApertureLayoutGuide *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
    }
    v9 = objc_opt_class();
    v10 = v8;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    if (!v12)
    {
      v13 = objc_opt_class();
      v14 = v10;
      if (v13)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v16 = v15;

      -[SBUISystemApertureLayoutGuide owningView](v16, "owningView");
      v12 = (SBUISystemApertureLayoutGuide *)objc_claimAutoreleasedReturnValue();

    }
    -[SBUISystemApertureLayoutGuide owningView](self, "owningView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v12 && (objc_msgSend(v17, "isDescendantOfView:", v12) & 1) == 0)
      v5 = -[SBUISystemApertureLayoutGuide isDescendantOfView:](v12, "isDescendantOfView:", v18);
    else
      v5 = 1;

  }
  return v5;
}

- (id)_rootGuideView
{
  void *v2;
  void *v3;
  void *v4;

  -[SBUISystemApertureLayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemApertureElementContextPrivate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutGuideRootView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_rootGuide
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  -[SBUISystemApertureLayoutGuide _rootGuideView](self, "_rootGuideView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureLayoutGuide identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SBUISA_systemApertureLayoutGuideWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (void)_activateConstraintsWithRootLayoutGuide
{
  SBUISystemApertureLayoutGuide *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  if (!-[SBUISystemApertureLayoutGuide _requiresInitialSetup](self, "_requiresInitialSetup"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureLayoutGuide.m"), 220, CFSTR("Illegal attempt to activateConstraintsWithRootLayoutGuide when requiresInitialSetup is NO."));

  }
  -[SBUISystemApertureLayoutGuide _rootGuide](self, "_rootGuide");
  v4 = (SBUISystemApertureLayoutGuide *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureLayoutGuide owningView](v4, "owningView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_currentRootGuideView, v5);

  if (v4 != self)
  {
    -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3718];
      -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deactivateConstraints:", v9);

    }
    if (v4)
    {
      -[SBUISystemApertureLayoutGuide centerXAnchor](self, "centerXAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUISystemApertureLayoutGuide centerXAnchor](v4, "centerXAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v21;
      -[SBUISystemApertureLayoutGuide centerYAnchor](self, "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUISystemApertureLayoutGuide centerYAnchor](v4, "centerYAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v10;
      -[SBUISystemApertureLayoutGuide widthAnchor](self, "widthAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUISystemApertureLayoutGuide widthAnchor](v4, "widthAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v13;
      -[SBUISystemApertureLayoutGuide heightAnchor](self, "heightAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUISystemApertureLayoutGuide heightAnchor](v4, "heightAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBUISystemApertureLayoutGuide setConstraints:](self, "setConstraints:", v17);
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v17);

    }
  }

}

- (BOOL)_createOrUpdateConstraintsIfIsRootAndInAWindow
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  SBUISystemApertureLayoutGuide *v10;
  BOOL v11;
  BOOL v12;
  BOOL result;
  void *v14;

  -[SBUISystemApertureLayoutGuide owningView](self, "owningView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = objc_opt_class();
    v8 = v3;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v6 = v9;

  }
  -[SBUISystemApertureLayoutGuide _rootGuide](self, "_rootGuide");
  v10 = (SBUISystemApertureLayoutGuide *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v10 != self || !v6)
    goto LABEL_18;
  if (-[SBUISystemApertureLayoutGuide _requiresFloatableFixedSize](self, "_requiresFloatableFixedSize"))
  {
    v12 = -[SBUISystemApertureLayoutGuide _createOrUpdateConcentricRootLayoutGuideWithWindow:](self, "_createOrUpdateConcentricRootLayoutGuideWithWindow:", v6);
LABEL_17:
    v11 = v12;
LABEL_18:

    return v11;
  }
  if (-[SBUISystemApertureLayoutGuide _requiresInsets](self, "_requiresInsets"))
  {
    v12 = -[SBUISystemApertureLayoutGuide _createOrUpdateInsetBasedRootGuideWithWindow:](self, "_createOrUpdateInsetBasedRootGuideWithWindow:", v6);
    goto LABEL_17;
  }
  if (-[SBUISystemApertureLayoutGuide _requiresExplicitFrame](self, "_requiresExplicitFrame"))
  {
    v12 = -[SBUISystemApertureLayoutGuide _createOrUpdateFixedFrameRootConstraintsWithWindow:](self, "_createOrUpdateFixedFrameRootConstraintsWithWindow:", v6);
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled layout guide identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBUISystemApertureLayoutGuide _createOrUpdateConstraintsIfIsRootAndInAWindow].cold.1();
  objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)_requiresInitialSetup
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;
  BOOL v9;

  -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 1;
  -[SBUISystemApertureLayoutGuide owningView](self, "owningView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureLayoutGuide _rootGuideView](self, "_rootGuideView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentRootGuideView);
  -[SBUISystemApertureLayoutGuide _rootGuideView](self, "_rootGuideView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = WeakRetained != v8;

  return v9;
}

- (BOOL)_requiresExplicitFrame
{
  if (-[SBUISystemApertureLayoutGuide _requiresInsets](self, "_requiresInsets"))
    return 0;
  else
    return !-[SBUISystemApertureLayoutGuide _requiresFloatableFixedSize](self, "_requiresFloatableFixedSize");
}

- (BOOL)_requiresInsets
{
  void *v2;
  char v3;

  -[SBUISystemApertureLayoutGuide identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SBUISystemApertureCustomControlsContentLayoutGuideIdentifier")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SBUISystemApertureLegibleContentLayoutMarginsGuideIdentifier"));

  return v3;
}

- (BOOL)_requiresFloatableFixedSize
{
  void *v2;
  char v3;

  -[SBUISystemApertureLayoutGuide identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SBUISystemApertureLeadingConcentricContentLayoutGuideIdentifier")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SBUISystemApertureTrailingConcentricContentLayoutGuideIdentifier"));

  return v3;
}

- (BOOL)_createOrUpdateFixedFrameRootConstraintsWithWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double *v9;
  double v10;
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double x;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  BOOL v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double MidX;
  void *v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  CGFloat MinY;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  void *v109;
  double v110;
  double v111;
  void *v112;
  uint64_t v113;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v117;
  void *v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  void *v123;
  uint64_t v124;
  void *v125;
  double MidY;
  void *v127;
  double rectb;
  double rect;
  void *rectc;
  CGFloat recta;
  void *rect_8;
  CGFloat rect_16;
  void *rect_16a;
  CGFloat rect_24;
  void *rect_24b;
  CGFloat rect_24a;
  _QWORD v138[6];
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;

  v138[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SBUISystemApertureLayoutGuide _requiresExplicitFrame](self, "_requiresExplicitFrame"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Don't set a frame on a layout guide that doesn't require one."));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBUISystemApertureLayoutGuide _createOrUpdateFixedFrameRootConstraintsWithWindow:].cold.2();
LABEL_49:
    objc_msgSend(objc_retainAutorelease(v123), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A4747C9CLL);
  }
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBUISystemApertureLayoutGuide identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (double *)MEMORY[0x1E0C9D648];
  v10 = *MEMORY[0x1E0C9D648];
  -[SBUISystemApertureLayoutGuide owningView](self, "owningView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "SBUISA_layoutMode");
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SBUISystemApertureObstructedAreaLayoutGuideIdentifier")))
  {
    objc_msgSend(v7, "SBUISA_obstructedAreaLayoutFrame");
LABEL_10:
    x = v13;
    v18 = v14;
    v19 = v15;
    v20 = v16;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SBUISystemApertureLeadingAreaLayoutGuideIdentifier")))
  {
    objc_msgSend(v7, "SBUISA_resolvedLeadingViewFrame");
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SBUISystemApertureTrailingAreaLayoutGuideIdentifier")))
  {
    objc_msgSend(v7, "SBUISA_resolvedTrailingViewFrame");
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SBUISystemApertureMinimalAreaLayoutGuideIdentifier")))
  {
    objc_msgSend(v7, "SBUISA_resolvedMinimalViewFrame");
    goto LABEL_10;
  }
  recta = v10;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("kSBUISystemApertureMinimumContentSizeLayoutMarginsGuideIdentifier")))
  {
    objc_msgSend(v4, "bounds");
    objc_msgSend(v4, "bounds");
    CGRectGetMinY(v149);
    objc_msgSend(v4, "bounds");
    MidX = CGRectGetMidX(v150);
    if (v12 != 2)
    {
      objc_msgSend(v11, "SBUISA_systemApertureObstructedAreaLayoutGuide", MidX);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "layoutFrame");
      objc_msgSend(v4, "convertRect:fromView:", v11);
      v80 = v79;
      v82 = v81;
      v84 = v83;
      v86 = v85;

      v151.origin.x = v80;
      v151.origin.y = v82;
      v151.size.width = v84;
      v151.size.height = v86;
      CGRectIsEmpty(v151);
    }
    objc_msgSend(v4, "bounds");
    v124 = 0;
    UIRectCenteredXInRectScale();
    x = v87;
    v18 = v88;
    v19 = v89;
    v20 = v90;
    goto LABEL_43;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("SBUISystemApertureMaximumContentSizeLayoutMarginsGuideIdentifier")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled layout guide identifier"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBUISystemApertureLayoutGuide _createOrUpdateFixedFrameRootConstraintsWithWindow:].cold.1();
    goto LABEL_49;
  }
  objc_msgSend(v11, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "layoutFrame");
  objc_msgSend(v4, "convertRect:fromView:", v11);
  v93 = v92;
  MinY = v94;
  v97 = v96;
  v99 = v98;

  if (v12 != 4)
  {
    if (v12 == 3)
    {
      +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "maximumCompactSize");
      v106 = v105;
      v108 = v107;

      v152.origin.x = v93;
      v152.origin.y = MinY;
      v152.size.width = v97;
      v152.size.height = v99;
      MinY = CGRectGetMinY(v152);
      +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "maximumExpandedSize");
      v111 = v110;
      v153.origin.x = recta;
      v153.origin.y = MinY;
      v153.size.width = v106;
      v153.size.height = v108;
      v93 = (v111 - CGRectGetWidth(v153)) * 0.5;

      v99 = v108;
      v97 = v106;
      goto LABEL_42;
    }
    if (v12 != 2)
    {
      -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = objc_msgSend(v112, "count");

      if (v113)
      {
        -[SBUISystemApertureLayoutGuide layoutFrame](self, "layoutFrame");
        objc_msgSend(v4, "convertRect:fromView:", v11);
        y = v154.origin.y;
        width = v154.size.width;
        height = v154.size.height;
        rect_24a = v154.origin.x;
        v117 = CGRectGetWidth(v154);
        v155.origin.x = v93;
        v155.origin.y = MinY;
        v155.size.width = v97;
        v155.size.height = v99;
        if (v117 < CGRectGetWidth(v155))
        {
          v99 = height;
          v97 = width;
          MinY = y;
          v93 = rect_24a;
        }
      }
      goto LABEL_42;
    }
  }
  objc_msgSend(v4, "bounds");
  v93 = v100;
  MinY = v101;
  v97 = v102;
  v99 = v103;
LABEL_42:
  +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "maximumExpandedSize");

  BSRectWithSize();
  objc_msgSend(v4, "bounds");
  v124 = 0;
  UIRectCenteredXInRectScale();
  v159.origin.x = v119;
  v159.origin.y = v120;
  v159.size.width = v121;
  v159.size.height = v122;
  v156.origin.x = v93;
  v156.origin.y = MinY;
  v156.size.width = v97;
  v156.size.height = v99;
  v157 = CGRectIntersection(v156, v159);
  x = v157.origin.x;
  v18 = v157.origin.y;
  v19 = v157.size.width;
  v20 = v157.size.height;
LABEL_43:
  v10 = recta;
LABEL_11:
  objc_msgSend(v11, "bounds", v124);
  v22 = v21;
  rect_16 = v24;
  rect_24 = v23;
  v26 = v25;
  if (v11 != v4)
  {
    objc_msgSend(v4, "convertRect:toView:", v11, x, v18, v19, v20);
    x = v27;
    v18 = v28;
    v19 = v29;
    v20 = v30;
  }
  rect_8 = v4;
  v139.origin.x = v22;
  v139.size.height = rect_16;
  v139.origin.y = rect_24;
  v139.size.width = v26;
  v158.origin.x = x;
  v158.origin.y = v18;
  v158.size.width = v19;
  v158.size.height = v20;
  v140 = CGRectIntersection(v139, v158);
  v31 = v140.origin.x;
  v32 = v140.origin.y;
  v33 = v140.size.width;
  v34 = v140.size.height;
  if (CGRectIsNull(v140))
    goto LABEL_16;
  v141.origin.x = v31;
  v141.origin.y = v32;
  v141.size.width = v33;
  v141.size.height = v34;
  if (CGRectIsInfinite(v141)
    || (v142.origin.x = v31, v142.origin.y = v32, v142.size.width = v33, v142.size.height = v34, CGRectIsEmpty(v142)))
  {
LABEL_16:
    v32 = v9[1];
    v33 = v9[2];
    v31 = v10;
    v34 = v9[3];
  }
  v143.origin.x = v31;
  v143.origin.y = v32;
  v143.size.width = v33;
  v143.size.height = v34;
  rectb = CGRectGetMidX(v143);
  v144.origin.x = v31;
  v144.origin.y = v32;
  v144.size.width = v33;
  v144.size.height = v34;
  MidY = CGRectGetMidY(v144);
  v145.origin.x = v22;
  v145.origin.y = rect_24;
  v145.size.width = v26;
  v145.size.height = rect_16;
  rect = rectb - CGRectGetMidX(v145);
  v146.origin.x = v22;
  v146.origin.y = rect_24;
  v146.size.width = v26;
  v146.size.height = rect_16;
  v35 = MidY - CGRectGetMidY(v146);
  v147.origin.x = v31;
  v147.origin.y = v32;
  v147.size.width = v33;
  v147.size.height = v34;
  v36 = CGRectGetWidth(v147);
  v148.origin.x = v31;
  v148.origin.y = v32;
  v148.size.width = v33;
  v148.size.height = v34;
  v37 = CGRectGetHeight(v148);
  -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "count");

  if (v39)
  {
    -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constant");
    v43 = v42 != rect;

    -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constant");
    if (v46 != v35)
      v43 = 1;

    -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectAtIndexedSubscript:", 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constant");
    if (v49 != v36)
      v43 = 1;

    -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectAtIndexedSubscript:", 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constant");
    v53 = v52 != v37 || v43;

    -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setConstant:", rect);

    -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectAtIndexedSubscript:", 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setConstant:", v35);

    -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectAtIndexedSubscript:", 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setConstant:", v36);

    -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectAtIndexedSubscript:", 3);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setConstant:", v37);

    -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "firstObject");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "isActive");

    if ((v64 & 1) == 0)
    {
      v65 = (void *)MEMORY[0x1E0CB3718];
      -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "activateConstraints:", v66);

    }
  }
  else
  {
    -[SBUISystemApertureLayoutGuide centerXAnchor](self, "centerXAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerXAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "constraintEqualToAnchor:constant:", v125, rect);
    rectc = (void *)objc_claimAutoreleasedReturnValue();
    v138[0] = rectc;
    -[SBUISystemApertureLayoutGuide centerYAnchor](self, "centerYAnchor");
    rect_24b = v7;
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    rect_16a = v8;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, v35);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v138[1] = v69;
    -[SBUISystemApertureLayoutGuide widthAnchor](self, "widthAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToConstant:", v36);
    v71 = v11;
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v138[2] = v72;
    -[SBUISystemApertureLayoutGuide heightAnchor](self, "heightAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToConstant:", v37);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v138[3] = v74;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 4);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v71;
    v8 = rect_16a;

    v7 = rect_24b;
    -[SBUISystemApertureLayoutGuide setConstraints:](self, "setConstraints:", v75);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v75);

    v53 = 1;
  }

  return v53;
}

- (BOOL)_createOrUpdateConcentricRootLayoutGuideWithWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[5];

  v53[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SBUISystemApertureLayoutGuide _requiresFloatableFixedSize](self, "_requiresFloatableFixedSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Illegal attempt to use floatable fixed size"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBUISystemApertureLayoutGuide _createOrUpdateConcentricRootLayoutGuideWithWindow:].cold.1();
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A47481C8);
  }
  -[SBUISystemApertureLayoutGuide identifier](self, "identifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureLayoutGuide owningView](self, "owningView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemApertureHostedElementContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemApertureElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_FBSScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "SBUISA_obstructedAreaLayoutFrame");
  v13 = v12;
  if (!objc_msgSend(v8, "isDescendantOfView:", v5))
  {
    v22 = 0;
    goto LABEL_24;
  }
  +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "expandedConcentricAreaSize");
  v16 = v15;
  v18 = v17;

  v19 = objc_msgSend(v5, "SBUISA_layoutMode");
  if ((unint64_t)(v19 + 1) < 4)
  {
    v13 = v13 * 0.5;
LABEL_5:
    v18 = v13;
    goto LABEL_6;
  }
  if (v19 == 3)
    goto LABEL_5;
  if (v19 == 4)
  {
    v13 = v16;
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
LABEL_6:
  -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SBUISystemApertureLeadingConcentricContentLayoutGuideIdentifier")) & 1) != 0)
  {
    objc_msgSend(v8, "leadingAnchor");
    v21 = objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureLayoutGuide leadingAnchor](self, "leadingAnchor");
  }
  else
  {
    objc_msgSend(v8, "trailingAnchor");
    v21 = objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureLayoutGuide trailingAnchor](self, "trailingAnchor");
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v11;
  if (objc_msgSend(v20, "count"))
  {
    v48 = v23;
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constant");
    v50 = (void *)v21;
    if (v25 == v13)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constant");
      v22 = v27 != v18;

    }
    else
    {
      v22 = 1;
    }

    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setConstant:", v13);

    objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setConstant:", v18);

    -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v37, "isActive") & 1) != 0)
    {

    }
    else
    {
      v38 = objc_msgSend(v5, "isDescendantOfView:", v8);

      if (v38)
      {
        v39 = (void *)MEMORY[0x1E0CB3718];
        -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "activateConstraints:", v40);

      }
    }
    v23 = v48;
    v33 = v50;
  }
  else
  {
    -[SBUISystemApertureLayoutGuide widthAnchor](self, "widthAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToConstant:", v13);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v46;
    -[SBUISystemApertureLayoutGuide heightAnchor](self, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", v18);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v44;
    -[SBUISystemApertureLayoutGuide topAnchor](self, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v29;
    objc_msgSend(v23, "constraintEqualToAnchor:", v21);
    v30 = (void *)v21;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
    v49 = v4;
    v32 = objc_claimAutoreleasedReturnValue();

    v33 = v30;
    -[SBUISystemApertureLayoutGuide setConstraints:](self, "setConstraints:", v32);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v32);
    v22 = 1;
    v20 = (void *)v32;
    v4 = v49;
  }

  v11 = v51;
LABEL_24:

  return v22;
}

- (BOOL)_createOrUpdateInsetBasedRootGuideWithWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MaxY;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  _QWORD v76[10];
  CGRect v77;

  v76[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SBUISystemApertureLayoutGuide _requiresInsets](self, "_requiresInsets"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Illegal attempt to use inset based guide when fixed frame required"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBUISystemApertureLayoutGuide _createOrUpdateInsetBasedRootGuideWithWindow:].cold.3();
    goto LABEL_28;
  }
  -[SBUISystemApertureLayoutGuide identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureLayoutGuide owningView](self, "owningView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemApertureHostedElementContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemApertureElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v8, "isDescendantOfView:", v6);
  if (!(_DWORD)v9)
    goto LABEL_19;
  v10 = objc_msgSend(v6, "SBUISA_layoutMode");
  if (v10 == 4)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("SBUISystemApertureLegibleContentLayoutMarginsGuideIdentifier")))
    {
      +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "expandedLegibleAreaInsets");
      goto LABEL_9;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("SBUISystemApertureCustomControlsContentLayoutGuideIdentifier")))
    {
      objc_msgSend(v8, "SBUISA_systemApertureObstructedAreaLayoutGuide");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "layoutFrame");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "expandedControlsAreaInsets");
      v18 = v30;
      v11 = v31;
      v19 = v32;

      v77.origin.x = v22;
      v77.origin.y = v24;
      v77.size.width = v26;
      v77.size.height = v28;
      MaxY = CGRectGetMaxY(v77);
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled layout guide identifier"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBUISystemApertureLayoutGuide _createOrUpdateInsetBasedRootGuideWithWindow:].cold.1();
LABEL_28:
    objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A4748878);
  }
  v11 = *(double *)(MEMORY[0x1E0CEA080] + 16);
  if (v10 != 3)
  {
    MaxY = *MEMORY[0x1E0CEA080];
    v18 = *(double *)(MEMORY[0x1E0CEA080] + 8);
    v19 = *(double *)(MEMORY[0x1E0CEA080] + 24);
    goto LABEL_15;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("SBUISystemApertureLegibleContentLayoutMarginsGuideIdentifier")))
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SBUISystemApertureCustomControlsContentLayoutGuideIdentifier")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled layout guide identifier"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBUISystemApertureLayoutGuide _createOrUpdateInsetBasedRootGuideWithWindow:].cold.2();
      objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A47488D4);
    }
    MaxY = 5.0;
    v19 = 10.0;
    v18 = 10.0;
    goto LABEL_15;
  }
  +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "compactLegibleAreaInsets");
LABEL_9:
  MaxY = v13;
  v18 = v14;
  v11 = v15;
  v19 = v16;

LABEL_15:
  -[SBUISystemApertureLayoutGuide constraints](self, "constraints");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setConstant:", MaxY);

    objc_msgSend(v33, "objectAtIndexedSubscript:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setConstant:", v18);

    objc_msgSend(v33, "objectAtIndexedSubscript:", 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setConstant:", -v11);

    objc_msgSend(v33, "objectAtIndexedSubscript:", 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setConstant:", -v19);

  }
  else
  {
    -[SBUISystemApertureLayoutGuide topAnchor](self, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v72, MaxY);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 1148845916;
    objc_msgSend(v71, "SBUISA_withPriority:", v38);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v70;
    -[SBUISystemApertureLayoutGuide leadingAnchor](self, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v68, v18);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v39) = 1148845916;
    objc_msgSend(v67, "SBUISA_withPriority:", v39);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v66;
    -[SBUISystemApertureLayoutGuide bottomAnchor](self, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, -v11);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = 1148845916;
    objc_msgSend(v63, "SBUISA_withPriority:", v40);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v76[2] = v62;
    -[SBUISystemApertureLayoutGuide trailingAnchor](self, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, -v19);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = 1148845916;
    objc_msgSend(v59, "SBUISA_withPriority:", v41);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v76[3] = v58;
    -[SBUISystemApertureLayoutGuide topAnchor](self, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintGreaterThanOrEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v76[4] = v54;
    -[SBUISystemApertureLayoutGuide leadingAnchor](self, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintGreaterThanOrEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v76[5] = v51;
    -[SBUISystemApertureLayoutGuide bottomAnchor](self, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v74 = v5;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintLessThanOrEqualToAnchor:", v42);
    v75 = v4;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v76[6] = v43;
    -[SBUISystemApertureLayoutGuide trailingAnchor](self, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v45 = (char)v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:", v9);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v76[7] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 8);
    v57 = objc_claimAutoreleasedReturnValue();

    LOBYTE(v9) = v45;
    v4 = v75;

    v5 = v74;
    v33 = (void *)v57;
    -[SBUISystemApertureLayoutGuide setConstraints:](self, "setConstraints:", v57);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v57);
  }

LABEL_19:
  return (char)v9;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_destroyWeak((id *)&self->_currentRootGuideView);
}

- (void)_createOrUpdateConstraintsIfIsRootAndInAWindow
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A471F000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_createOrUpdateFixedFrameRootConstraintsWithWindow:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A471F000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_createOrUpdateFixedFrameRootConstraintsWithWindow:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A471F000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_createOrUpdateConcentricRootLayoutGuideWithWindow:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A471F000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_createOrUpdateInsetBasedRootGuideWithWindow:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A471F000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_createOrUpdateInsetBasedRootGuideWithWindow:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A471F000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_createOrUpdateInsetBasedRootGuideWithWindow:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1A471F000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
