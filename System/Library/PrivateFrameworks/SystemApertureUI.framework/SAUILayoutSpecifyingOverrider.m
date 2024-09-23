@implementation SAUILayoutSpecifyingOverrider

- (void)addBehaviorOverridingParticipant:(id)a3
{
  SAUILayoutSpecifyingOverrider *v4;
  NSPointerArray *orderedBehaviorOverridingParticipants;
  uint64_t v6;
  NSPointerArray *v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    v4 = self;
    objc_sync_enter(v4);
    orderedBehaviorOverridingParticipants = v4->_orderedBehaviorOverridingParticipants;
    if (!orderedBehaviorOverridingParticipants)
    {
      objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v4->_orderedBehaviorOverridingParticipants;
      v4->_orderedBehaviorOverridingParticipants = (NSPointerArray *)v6;

      orderedBehaviorOverridingParticipants = v4->_orderedBehaviorOverridingParticipants;
    }
    -[NSPointerArray sa_compact](orderedBehaviorOverridingParticipants, "sa_compact");
    if (-[NSPointerArray count](v4->_orderedBehaviorOverridingParticipants, "count"))
    {
      v8 = objc_msgSend(v12, "behaviorOverridingRole");
      for (i = 0; ; ++i)
      {
        if (i >= -[NSPointerArray count](v4->_orderedBehaviorOverridingParticipants, "count"))
          goto LABEL_14;
        -[NSPointerArray pointerAtIndex:](v4->_orderedBehaviorOverridingParticipants, "pointerAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "behaviorOverridingRole");
        if (v11 == v8)
          break;
        if (v11 < v8)
        {
          -[NSPointerArray insertPointer:atIndex:](v4->_orderedBehaviorOverridingParticipants, "insertPointer:atIndex:", v12, i);
          goto LABEL_13;
        }

      }
      -[NSPointerArray replacePointerAtIndex:withPointer:](v4->_orderedBehaviorOverridingParticipants, "replacePointerAtIndex:withPointer:", i, v12);
LABEL_13:

      goto LABEL_14;
    }
    -[NSPointerArray addPointer:](v4->_orderedBehaviorOverridingParticipants, "addPointer:", v12);
LABEL_14:
    objc_sync_exit(v4);

  }
}

- (SAUILayoutSpecifyingOverrider)initWithTarget:(id)a3
{
  id v4;
  SAUILayoutSpecifyingOverrider *v5;
  SAUILayoutSpecifyingOverrider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SAUILayoutSpecifyingOverrider;
  v5 = -[SAUILayoutSpecifyingOverrider init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_behaviorOverridingTarget, v4);
    -[SAUILayoutSpecifyingOverrider addBehaviorOverridingParticipant:](v6, "addBehaviorOverridingParticipant:", v6);
  }

  return v6;
}

- (id)_behaviorOverridingParticipantSubordinate:(BOOL)a3 toParticipant:(id)a4 passingTest:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  SAUILayoutSpecifyingOverrider *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  SAUILayoutSpecifyingOverrider *v19;
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  if (v8)
  {
    v10 = self;
    objc_sync_enter(v10);
    -[NSPointerArray sa_compact](v10->_orderedBehaviorOverridingParticipants, "sa_compact");
    v11 = -[NSPointerArray count](v10->_orderedBehaviorOverridingParticipants, "count");
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 0;
    -[NSPointerArray allObjects](v10->_orderedBehaviorOverridingParticipants, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v13 = 0;
    else
      v13 = 2;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __101__SAUILayoutSpecifyingOverrider__behaviorOverridingParticipantSubordinate_toParticipant_passingTest___block_invoke;
    v17[3] = &unk_25193D0C0;
    v21 = v25;
    v24 = v6;
    v23 = v11;
    v18 = v8;
    v19 = v10;
    v20 = v9;
    v22 = &v27;
    objc_msgSend(v12, "enumerateObjectsWithOptions:usingBlock:", v13, v17);

    _Block_object_dispose(v25, 8);
    objc_sync_exit(v10);

    v14 = (void *)v28[5];
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __101__SAUILayoutSpecifyingOverrider__behaviorOverridingParticipantSubordinate_toParticipant_passingTest___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v7 = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v8 + 24)
    || (*(_BYTE *)(v8 + 24) = *(_QWORD *)(a1 + 32) == (_QWORD)v7,
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)))
  {
    if (*(_BYTE *)(a1 + 80))
    {
      if (*(_QWORD *)(a1 + 72) - 1 <= a3)
        goto LABEL_13;
      v9 = a3 + 1;
    }
    else
    {
      if (!a3)
        goto LABEL_13;
      v9 = a3 - 1;
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v7;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pointerAtIndex:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      if (!v11 || (*(unsigned int (**)(uint64_t, void *))(v11 + 16))(v11, v10))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v10);
        *a4 = 1;
      }

      v7 = v12;
    }
  }
LABEL_13:

}

- (id)behaviorOverridingParticipantSubordinateToParticipant:(id)a3
{
  return -[SAUILayoutSpecifyingOverrider _behaviorOverridingParticipantSubordinate:toParticipant:passingTest:](self, "_behaviorOverridingParticipantSubordinate:toParticipant:passingTest:", 1, a3, 0);
}

- (id)behaviorOverridingParticipantSuperiorToParticipant:(id)a3
{
  return -[SAUILayoutSpecifyingOverrider _behaviorOverridingParticipantSubordinate:toParticipant:passingTest:](self, "_behaviorOverridingParticipantSubordinate:toParticipant:passingTest:", 0, a3, 0);
}

- (void)removeBehaviorOverridingParticipant:(id)a3
{
  SAUILayoutSpecifyingOverrider *v4;
  unint64_t i;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = self;
    objc_sync_enter(v4);
    for (i = 0; i < -[NSPointerArray count](v4->_orderedBehaviorOverridingParticipants, "count"); ++i)
    {
      if (-[NSPointerArray pointerAtIndex:](v4->_orderedBehaviorOverridingParticipants, "pointerAtIndex:", i) == v6)
      {
        -[NSPointerArray removePointerAtIndex:](v4->_orderedBehaviorOverridingParticipants, "removePointerAtIndex:", i);
        break;
      }
    }
    objc_sync_exit(v4);

  }
}

- (void)removeBehaviorOverridingParticipantWithRole:(int64_t)a3
{
  unint64_t i;
  void *v5;
  SAUILayoutSpecifyingOverrider *obj;

  obj = self;
  objc_sync_enter(obj);
  for (i = 0; i < -[NSPointerArray count](obj->_orderedBehaviorOverridingParticipants, "count"); ++i)
  {
    -[NSPointerArray pointerAtIndex:](obj->_orderedBehaviorOverridingParticipants, "pointerAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "behaviorOverridingRole") == a3)
    {
      -[NSPointerArray removePointerAtIndex:](obj->_orderedBehaviorOverridingParticipants, "removePointerAtIndex:", i);

      break;
    }

  }
  objc_sync_exit(obj);

}

- (int64_t)layoutMode
{
  void *v3;
  int64_t v4;
  char v6;

  v6 = 0;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_layoutModeForTargetWithOverrider_isDefaultValue_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutModeForTargetWithOverrider:isDefaultValue:", self, &v6);

  return v4;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  id v7;

  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_setLayoutMode_reason_forTargetWithOverrider_);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLayoutMode:reason:forTargetWithOverrider:", a3, a4, self);

}

- (void)setLayoutMode:(int64_t)a3
{
  -[SAUILayoutSpecifyingOverrider setLayoutMode:reason:](self, "setLayoutMode:reason:", a3, 0);
}

- (int64_t)minimumSupportedLayoutMode
{
  void *v3;
  int64_t v4;
  char v6;

  v6 = 0;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_minimumSupportedLayoutModeForTargetWithOverrider_isDefaultValue_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "minimumSupportedLayoutModeForTargetWithOverrider:isDefaultValue:", self, &v6);

  return v4;
}

- (int64_t)maximumSupportedLayoutMode
{
  void *v3;
  int64_t v4;
  char v6;

  v6 = 0;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_maximumSupportedLayoutModeForTargetWithOverrider_isDefaultValue_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maximumSupportedLayoutModeForTargetWithOverrider:isDefaultValue:", self, &v6);

  return v4;
}

- (int64_t)preferredLayoutMode
{
  void *v2;
  int64_t v3;

  -[SAUILayoutSpecifyingOverrider layoutModePreference](self, "layoutModePreference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredLayoutMode");

  return v3;
}

- (BOOL)isInteractiveDismissalEnabled
{
  SAUILayoutSpecifyingOverrider *v2;
  void *v3;
  char v5;

  v2 = self;
  v5 = 0;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_isInteractiveDismissalEnabledForTargetWithOverrider_isDefaultValue_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isInteractiveDismissalEnabledForTargetWithOverrider:isDefaultValue:", v2, &v5);

  return (char)v2;
}

- (BOOL)isMinimalPresentationPossible
{
  SAUILayoutSpecifyingOverrider *v2;
  void *v3;
  char v5;

  v2 = self;
  v5 = 0;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_isMinimalPresentationPossibleForTargetWithOverrider_isDefaultValue_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isMinimalPresentationPossibleForTargetWithOverrider:isDefaultValue:", v2, &v5);

  return (char)v2;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  char v28;
  NSDirectionalEdgeInsets result;

  trailing = a5.trailing;
  bottom = a5.bottom;
  leading = a5.leading;
  top = a5.top;
  v9 = a4.trailing;
  v10 = a4.bottom;
  v11 = a4.leading;
  v12 = a4.top;
  v28 = 0;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_forTargetWithOverrider_isDefaultValue_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:forTargetWithOverrider:isDefaultValue:", a3, self, &v28, v12, v11, v10, v9, top, leading, bottom, trailing);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.trailing = v27;
  result.bottom = v26;
  result.leading = v25;
  result.top = v24;
  return result;
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v17 = 0;
  v9 = a4;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_sizeThatFitsSize_forProvidedView_inLayoutMode_forTargetWithOverrider_isDefaultValue_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFitsSize:forProvidedView:inLayoutMode:forTargetWithOverrider:isDefaultValue:", v9, a5, self, &v17, width, height);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  id v6;
  void *v7;
  char v9;

  v9 = 0;
  v6 = a3;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_isProvidedViewConcentric_inLayoutMode_forTargetWithOverrider_isDefaultValue_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "isProvidedViewConcentric:inLayoutMode:forTargetWithOverrider:isDefaultValue:", v6, a4, self, &v9);

  return a4;
}

- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_layoutHostContainerViewWillLayoutSubviews_forTargetWithOverrider_);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutHostContainerViewWillLayoutSubviews:forTargetWithOverrider:", v4, self);

}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_layoutHostContainerViewDidLayoutSubviews_forTargetWithOverrider_);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutHostContainerViewDidLayoutSubviews:forTargetWithOverrider:", v4, self);

}

- (BOOL)isRequestingMenuPresentation
{
  SAUILayoutSpecifyingOverrider *v2;
  void *v3;
  char v5;

  v2 = self;
  v5 = 0;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_isRequestingMenuPresentationForTargetWithOverrider_isDefaultValue_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isRequestingMenuPresentationForTargetWithOverrider:isDefaultValue:", v2, &v5);

  return (char)v2;
}

- (SAUILayoutModePreferring)layoutModePreference
{
  void *v3;
  void *v4;
  char v6;

  v6 = 0;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_layoutModePreferenceForTargetWithOverrider_isDefaultValue_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutModePreferenceForTargetWithOverrider:isDefaultValue:", self, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SAUILayoutModePreferring *)v4;
}

- (SAUIPreferredLayoutModeAssertion)preferredLayoutModeAssertion
{
  void *v3;
  void *v4;
  char v6;

  v6 = 0;
  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_preferredLayoutModeAssertionForTargetWithOverrider_isDefaultValue_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLayoutModeAssertionForTargetWithOverrider:isDefaultValue:", self, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SAUIPreferredLayoutModeAssertion *)v4;
}

- (NSArray)preferredLayoutModeAssertions
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[SAUILayoutSpecifyingOverrider preferredLayoutModeAssertion](self, "preferredLayoutModeAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, 0);

  return (NSArray *)v5;
}

- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  id v7;

  -[SAUILayoutSpecifyingOverrider _firstParticipantThatRespondsToSelector:](self, "_firstParticipantThatRespondsToSelector:", sel_setPreferredLayoutMode_reason_forTargetWithOverrider_);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredLayoutMode:reason:forTargetWithOverrider:", a3, a4, self);

}

- (int64_t)behaviorOverridingRole
{
  return 0;
}

- (int64_t)layoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained;
  int64_t v6;

  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(WeakRetained, "layoutMode");
  }
  else
  {
    v6 = 0;
    if (a4)
      *a4 = 1;
  }

  return v6;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setLayoutMode:reason:", a3, a4);

}

- (int64_t)minimumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained;
  int64_t v6;

  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(WeakRetained, "minimumSupportedLayoutMode");
  }
  else
  {
    v6 = 0;
    if (a4)
      *a4 = 1;
  }

  return v6;
}

- (int64_t)maximumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained;
  int64_t v6;

  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(WeakRetained, "maximumSupportedLayoutMode");
  }
  else
  {
    v6 = 0;
    if (a4)
      *a4 = 1;
  }

  return v6;
}

- (int64_t)preferredLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  void *v4;
  int64_t v5;

  -[SAUILayoutSpecifyingOverrider layoutModePreferenceForTargetWithOverrider:isDefaultValue:](self, "layoutModePreferenceForTargetWithOverrider:isDefaultValue:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "preferredLayoutMode");

  return v5;
}

- (BOOL)isInteractiveDismissalEnabledForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained;
  char v6;

  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(WeakRetained, "isInteractiveDismissalEnabled");
  }
  else
  {
    v6 = 0;
    if (a4)
      *a4 = 1;
  }

  return v6;
}

- (BOOL)isMinimalPresentationPossibleForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained;
  char v6;

  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(WeakRetained, "isMinimalPresentationPossible");
  }
  else
  {
    v6 = 0;
    if (a4)
      *a4 = 1;
  }

  return v6;
}

- (id)preferredLayoutModeAssertionForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "preferredLayoutModeAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    if (a4)
      *a4 = 1;
  }

  return v6;
}

- (id)layoutModePreferenceForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained;
  uint64_t v6;
  char v7;
  SAUILayoutModePreference *v8;
  SAUILayoutModePreference *v9;

  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "layoutModePreference");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (SAUILayoutModePreference *)v6;
    goto LABEL_6;
  }
  v7 = objc_opt_respondsToSelector();
  v8 = [SAUILayoutModePreference alloc];
  if ((v7 & 1) != 0)
  {
    v6 = -[SAUILayoutModePreference initWithPreferredLayoutMode:reason:](v8, "initWithPreferredLayoutMode:reason:", objc_msgSend(WeakRetained, "preferredLayoutMode"), 1);
    goto LABEL_5;
  }
  v9 = -[SAUILayoutModePreference initWithPreferredLayoutMode:reason:](v8, "initWithPreferredLayoutMode:reason:", 2, 0);
  if (a4)
    *a4 = 1;
LABEL_6:

  return v9;
}

- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setPreferredLayoutMode:reason:", a3, a4);

}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSDirectionalEdgeInsets result;

  trailing = a5.trailing;
  bottom = a5.bottom;
  leading = a5.leading;
  top = a5.top;
  v12 = a4.trailing;
  v13 = a4.bottom;
  v14 = a4.leading;
  v15 = a4.top;
  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:", a3, v15, v14, v13, v12, top, leading, bottom, trailing);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
  }
  else
  {
    v19 = *MEMORY[0x24BDF65E8];
    v21 = *(double *)(MEMORY[0x24BDF65E8] + 8);
    v23 = *(double *)(MEMORY[0x24BDF65E8] + 16);
    v25 = *(double *)(MEMORY[0x24BDF65E8] + 24);
    if (a7)
      *a7 = 1;
  }

  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.trailing = v29;
  result.bottom = v28;
  result.leading = v27;
  result.top = v26;
  return result;
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7
{
  double height;
  double width;
  id v12;
  id WeakRetained;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v12 = a4;
  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v12, a5, width, height);
    v15 = v14;
    v17 = v16;
  }
  else
  {
    v15 = *MEMORY[0x24BDBF148];
    v17 = *(double *)(MEMORY[0x24BDBF148] + 8);
    if (a7)
      *a7 = 1;
  }

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4 forTargetWithOverrider:(id)a5 isDefaultValue:(BOOL *)a6
{
  id v9;
  id WeakRetained;
  char v11;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(WeakRetained, "isProvidedViewConcentric:inLayoutMode:", v9, a4);
  }
  else
  {
    v11 = 1;
    if (a6)
      *a6 = 1;
  }

  return v11;
}

- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3 forTargetWithOverrider:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "layoutHostContainerViewWillLayoutSubviews:", v6);

}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3 forTargetWithOverrider:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "layoutHostContainerViewDidLayoutSubviews:", v6);

}

- (BOOL)isRequestingMenuPresentationForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id WeakRetained;
  char v6;

  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(WeakRetained, "isRequestingMenuPresentation");
  }
  else
  {
    v6 = 0;
    if (a4)
      *a4 = 1;
  }

  return v6;
}

- (SAUILayoutSpecifying)layoutSpecifyingOverridingTarget
{
  id WeakRetained;
  void *v3;
  SAUILayoutSpecifying *v4;

  WeakRetained = objc_loadWeakRetained(&self->_behaviorOverridingTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = WeakRetained;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)layoutSpecifyingOverridingParticipantSubordinateToParticipant:(id)a3 thatRespondsToSelector:(SEL)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __118__SAUILayoutSpecifyingOverrider_layoutSpecifyingOverridingParticipantSubordinateToParticipant_thatRespondsToSelector___block_invoke;
  v5[3] = &__block_descriptor_40_e43_B16__0___SABehaviorOverridingParticipant__8l;
  v5[4] = a4;
  -[SAUILayoutSpecifyingOverrider _behaviorOverridingParticipantSubordinate:toParticipant:passingTest:](self, "_behaviorOverridingParticipantSubordinate:toParticipant:passingTest:", 1, a3, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __118__SAUILayoutSpecifyingOverrider_layoutSpecifyingOverridingParticipantSubordinateToParticipant_thatRespondsToSelector___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)layoutSpecifyingOverridingParticipantSuperiorToParticipant:(id)a3 thatRespondsToSelector:(SEL)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __115__SAUILayoutSpecifyingOverrider_layoutSpecifyingOverridingParticipantSuperiorToParticipant_thatRespondsToSelector___block_invoke;
  v5[3] = &__block_descriptor_40_e43_B16__0___SABehaviorOverridingParticipant__8l;
  v5[4] = a4;
  -[SAUILayoutSpecifyingOverrider _behaviorOverridingParticipantSubordinate:toParticipant:passingTest:](self, "_behaviorOverridingParticipantSubordinate:toParticipant:passingTest:", 0, a3, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __115__SAUILayoutSpecifyingOverrider_layoutSpecifyingOverridingParticipantSuperiorToParticipant_thatRespondsToSelector___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  SAUILayoutSpecifyingOverrider *v7;
  NSPointerArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  objc_class *v15;
  void *v16;
  id WeakRetained;
  objc_class *v18;
  void *v19;
  id *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  v7 = self;
  objc_sync_enter(v7);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id *)&v7->super.isa;
  v8 = v7->_orderedBehaviorOverridingParticipants;
  v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "behaviorOverridingRole");
        v14 = CFSTR("[UNKNOWN]");
        if (v13 <= 3)
          v14 = *(&off_25193D100 + v13);
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("; '%@': <%@: %p>"), v14, v16, v12);

      }
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  objc_sync_exit(obj);
  WeakRetained = objc_loadWeakRetained(obj + 2);
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; 'behaviorOverridingTarget': <%@: %p>"), v19, WeakRetained);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (id)_firstParticipantThatRespondsToSelector:(SEL)a3
{
  SAUILayoutSpecifyingOverrider *v3;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self;
  objc_sync_enter(v3);
  -[NSPointerArray sa_compact](v3->_orderedBehaviorOverridingParticipants, "sa_compact");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3->_orderedBehaviorOverridingParticipants;
  v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  objc_sync_exit(v3);
  return v9;
}

- (id)behaviorOverridingTarget
{
  return objc_loadWeakRetained(&self->_behaviorOverridingTarget);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_behaviorOverridingTarget);
  objc_storeStrong((id *)&self->_orderedBehaviorOverridingParticipants, 0);
}

@end
