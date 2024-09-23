@implementation SBMainSwitcherRoutingSwitcherModifier

- (SBMainSwitcherRoutingSwitcherModifier)initWithMainModifierSubtree:(id)a3 floatingModifierSubtree:(id)a4
{
  id v7;
  id v8;
  SBMainSwitcherRoutingSwitcherModifier *v9;
  SBMainSwitcherRoutingSwitcherModifier *v10;
  id *p_mainModifierSubtree;
  SBRoutingSwitcherModifier *v12;
  void *v13;
  uint64_t v14;
  SBRoutingSwitcherModifier *routingModifier;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBMainSwitcherRoutingSwitcherModifier;
  v9 = -[SBSwitcherModifier init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    p_mainModifierSubtree = (id *)&v9->_mainModifierSubtree;
    objc_storeStrong((id *)&v9->_mainModifierSubtree, a3);
    objc_storeStrong((id *)&v10->_floatingModifierSubtree, a4);
    objc_storeStrong((id *)&v10->_currentScrollableSubtree, *p_mainModifierSubtree);
    objc_storeStrong((id *)&v10->_activeSubtree, *p_mainModifierSubtree);
    v12 = [SBRoutingSwitcherModifier alloc];
    v18[0] = v10->_floatingModifierSubtree;
    v18[1] = *p_mainModifierSubtree;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBRoutingSwitcherModifier initWithModifiers:delegate:](v12, "initWithModifiers:delegate:", v13, v10);
    routingModifier = v10->_routingModifier;
    v10->_routingModifier = (SBRoutingSwitcherModifier *)v14;

    -[SBChainableModifier addChildModifier:](v10, "addChildModifier:", v10->_routingModifier);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)-[SBSwitcherModifier copy](self->_mainModifierSubtree, "copy");
  v6 = (void *)-[SBSwitcherModifier copy](self->_floatingModifierSubtree, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithMainModifierSubtree:floatingModifierSubtree:", v5, v6);

  return v7;
}

- (id)debugPotentialChildModifiers
{
  SBSwitcherModifier *floatingModifierSubtree;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  floatingModifierSubtree = self->_floatingModifierSubtree;
  v4[0] = self->_mainModifierSubtree;
  v4[1] = floatingModifierSubtree;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)routingModifier:(id)a3 event:(id)a4 forModifier:(id)a5
{
  id v7;
  SBSwitcherModifier *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;

  v7 = a4;
  v8 = (SBSwitcherModifier *)a5;
  if (objc_msgSend(v7, "type") == 17)
  {
    objc_msgSend(v7, "appLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "environment");

    v11 = v10 != 2;
    v12 = v10 == 2;
  }
  else
  {
    v12 = 1;
    v11 = 1;
  }
  if (objc_msgSend(v7, "type") == 16)
  {
    if (self->_floatingSwitcherVisible)
    {
      v11 = 0;
      v12 = 1;
    }
    else
    {
      v12 = self->_currentEnvironmentMode == 3;
      v11 = 1;
    }
  }
  if (objc_msgSend(v7, "type") == 12)
  {
    objc_msgSend(v7, "appLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "environment");

    v11 = v14 != 2;
    v12 = v14 == 2;
  }
  if (objc_msgSend(v7, "type") == 14)
  {
    objc_msgSend(v7, "appLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "environment");

    v11 = v16 != 2;
    v12 = v16 == 2;
  }
  if (objc_msgSend(v7, "type") == 13)
  {
    objc_msgSend(v7, "appLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "environment");

    v11 = v18 != 2;
    v12 = v18 == 2;
  }
  if (self->_mainModifierSubtree == v8 || (v11 = v12, self->_floatingModifierSubtree == v8))
  {
    if (v11)
      v20 = v7;
    else
      v20 = 0;
    v19 = v20;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)routingModifier:(id)a3 filteredAppLayouts:(id)a4 forModifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  SBMainSwitcherRoutingSwitcherModifier *v13;

  v7 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__SBMainSwitcherRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke;
  v11[3] = &unk_1E8EA4E78;
  v12 = v7;
  v13 = self;
  v8 = v7;
  objc_msgSend(a4, "bs_filter:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __88__SBMainSwitcherRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104);
  v4 = objc_msgSend(a2, "environment");
  if (v2 == v3)
    return v4 != 2;
  else
    return v4 == 2;
}

- (id)routingModifier:(id)a3 filteredContinuousExposeIdentifiers:(id)a4 forModifier:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v8 = v7;
  if (self->_mainModifierSubtree == a5)
    v9 = v7;
  else
    v9 = (id)MEMORY[0x1E0C9AA60];

  return v9;
}

- (id)routingModifier:(id)a3 modifierForAppLayout:(id)a4
{
  uint64_t v5;
  int *v6;

  v5 = objc_msgSend(a4, "environment", a3);
  v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
  if (v5 == 2)
    v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
  return *(id *)((char *)&self->super.super.super.isa + *v6);
}

- (id)scrollModifierForRoutingModifier:(id)a3
{
  return self->_currentScrollableSubtree;
}

- (id)homeScreenModifierForRoutingModifier:(id)a3
{
  return self->_mainModifierSubtree;
}

- (id)transactionCompletionOptionsModifierForRoutingModifier:(id)a3
{
  return self->_activeSubtree;
}

- (id)routingModifier:(id)a3 animationAttributesModifierForLayoutElement:(id)a4
{
  return -[SBMainSwitcherRoutingSwitcherModifier _modifierToHandleLayoutElement:](self, "_modifierToHandleLayoutElement:", a4);
}

- (id)_modifierToHandleLayoutElement:(id)a3
{
  id v4;
  uint64_t v5;
  int *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "switcherLayoutElementType");
  v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
  if ((unint64_t)(v5 - 2) >= 3)
  {
    if (v5)
    {
      v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
    }
    else if (objc_msgSend(v4, "environment") != 2)
    {
      v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
    }
  }
  v7 = *(id *)((char *)&self->super.super.super.isa + *v6);

  return v7;
}

- (id)fallbackModifierForRoutingModifier:(id)a3
{
  return self->_mainModifierSubtree;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  objc_super v38;
  CGRect v39;
  CGRect v40;

  v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)SBMainSwitcherRoutingSwitcherModifier;
  if (!-[SBMainSwitcherRoutingSwitcherModifier isLayoutRoleOccluded:inAppLayout:](&v38, sel_isLayoutRoleOccluded_inAppLayout_, a3, v6))
  {
    if (self->_floatingAppLayout
      && self->_currentEnvironmentMode == 3
      && (unint64_t)(self->_floatingConfiguration - 1) <= 1)
    {
      -[SBMainSwitcherRoutingSwitcherModifier appLayouts](self, "appLayouts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "containsObject:", v6) & 1) != 0)
      {
        -[SBMainSwitcherRoutingSwitcherModifier appLayouts](self, "appLayouts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", self->_floatingAppLayout);

        if (v10)
        {
          -[SBMainSwitcherRoutingSwitcherModifier appLayouts](self, "appLayouts");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBMainSwitcherRoutingSwitcherModifier frameForIndex:](self, "frameForIndex:", objc_msgSend(v11, "indexOfObject:", v6));
          v13 = v12;
          v15 = v14;
          v17 = v16;
          v19 = v18;

          -[SBMainSwitcherRoutingSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v6, v13, v15, v17, v19);
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;
          -[SBMainSwitcherRoutingSwitcherModifier appLayouts](self, "appLayouts");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBMainSwitcherRoutingSwitcherModifier frameForIndex:](self, "frameForIndex:", objc_msgSend(v28, "indexOfObject:", self->_floatingAppLayout));
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v36 = v35;

          v39.origin.x = v21;
          v39.origin.y = v23;
          v39.size.width = v25;
          v39.size.height = v27;
          v40.origin.x = v30;
          v40.origin.y = v32;
          v40.size.width = v34;
          v40.size.height = v36;
          v7 = CGRectIntersectsRect(v39, v40);
          goto LABEL_11;
        }
      }
      else
      {

      }
    }
    v7 = 0;
    goto LABEL_11;
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  void *v31;
  uint64_t v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  objc_super v38;

  v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)SBMainSwitcherRoutingSwitcherModifier;
  v7 = -[SBMainSwitcherRoutingSwitcherModifier canPerformKeyboardShortcutAction:forBundleIdentifier:](&v38, sel_canPerformKeyboardShortcutAction_forBundleIdentifier_, a3, v6);
  LODWORD(v8) = v7;
  switch(a3)
  {
    case 4:
    case 5:
    case 15:
    case 16:
      if (v7)
      {
        if (self->_currentEnvironmentMode != 3)
          goto LABEL_19;
        -[SBSwitcherModifier visibleAppLayouts](self->_mainModifierSubtree, "visibleAppLayouts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "bs_containsObjectPassingTest:", &__block_literal_global_6_0))
        {
          -[SBSwitcherModifier visibleAppLayouts](self->_floatingModifierSubtree, "visibleAppLayouts");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = objc_msgSend(v10, "count") != 0;

        }
        else
        {
          LOBYTE(v8) = 1;
        }

      }
      goto LABEL_35;
    case 9:
    case 10:
      v34 = 0;
      v35 = &v34;
      v36 = 0x2020000000;
      v37 = 0;
      -[SBSwitcherModifier visibleAppLayouts](self->_floatingModifierSubtree, "visibleAppLayouts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        -[SBMainSwitcherRoutingSwitcherModifier appLayouts](self, "appLayouts");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_3;
        v33[3] = &unk_1E8EA5FF0;
        v33[4] = &v34;
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v33);

      }
      if ((_DWORD)v8)
        LOBYTE(v8) = self->_currentEnvironmentMode == 3 && *((_DWORD *)v35 + 6) > 1;
      _Block_object_dispose(&v34, 8);
      goto LABEL_35;
    case 12:
      if (v7)
      {
        if (self->_currentEnvironmentMode == 3)
        {
          -[SBSwitcherModifier visibleAppLayouts](self->_mainModifierSubtree, "visibleAppLayouts");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = objc_msgSend(v20, "bs_containsObjectPassingTest:", &__block_literal_global_66);

        }
        else
        {
LABEL_19:
          LOBYTE(v8) = 0;
        }
      }
      goto LABEL_35;
    case 13:
    case 14:
      v14 = v7;
      if (!v6)
      {
        -[SBMainSwitcherRoutingSwitcherModifier leafAppLayoutForKeyboardFocusedScene](self, "leafAppLayoutForKeyboardFocusedScene");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
        v22 = 1;
        if (a3 == 13)
          v23 = 1;
        else
          v23 = 2;
        if (a3 == 13)
          v22 = 2;
        if (v21 == 1)
          v24 = v22;
        else
          v24 = v23;
        -[SBSwitcherModifier visibleAppLayouts](self->_mainModifierSubtree, "visibleAppLayouts");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_4;
        v30[3] = &unk_1E8EA6018;
        v31 = v8;
        v32 = v24;
        v16 = v8;
        v26 = objc_msgSend(v25, "bs_containsObjectPassingTest:", v30);

        LOBYTE(v8) = v14 & (v26 ^ 1);
        v19 = v31;
        goto LABEL_29;
      }
      +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "applicationWithBundleIdentifier:", v6);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v16, "info");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v8, "supportsMultiwindow");

        LOBYTE(v8) = v17 & v14;
        if ((v17 & 1) == 0 && ((v14 ^ 1) & 1) == 0)
        {
          -[SBSwitcherModifier visibleAppLayouts](self->_mainModifierSubtree, "visibleAppLayouts");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_5;
          v28[3] = &unk_1E8E9DF78;
          v29 = v6;
          LODWORD(v8) = objc_msgSend(v18, "bs_containsObjectPassingTest:", v28) ^ 1;

          v19 = v29;
LABEL_29:

        }
      }

LABEL_35:
      return (char)v8;
    default:
      goto LABEL_35;
  }
}

BOOL __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration(objc_msgSend(a2, "configuration"));
  return SBSpaceConfigurationIsSplitView(v2);
}

BOOL __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration(objc_msgSend(a2, "centerConfiguration"));
  return SBCenterConfigurationIsValid(v2);
}

uint64_t __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "environment");
  if (result == 2)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 2)
    *a4 = 1;
  return result;
}

BOOL __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration(objc_msgSend(v3, "configuration"));
  if (SBSpaceConfigurationIsSplitView(v4))
  {
    objc_msgSend(v3, "leafAppLayoutForRole:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == *(void **)(a1 + 32);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItemWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  char v5;
  int *v6;
  int v7;
  SBAppLayout *v8;
  SBAppLayout *floatingAppLayout;
  _BOOL4 v10;
  _BOOL4 v11;
  BOOL v12;
  BOOL v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  int *v22;
  SBSwitcherModifier *v23;
  SBSwitcherModifier *activeSubtree;
  void *v25;
  objc_super v27;

  v4 = a3;
  v5 = objc_msgSend(v4, "toFloatingSwitcherVisible");
  v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v4, "fromFloatingSwitcherVisible");
    v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
    if (v7)
      v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
  }
  objc_storeStrong((id *)&self->_currentScrollableSubtree, *(id *)((char *)&self->super.super.super.isa + *v6));
  self->_currentEnvironmentMode = objc_msgSend(v4, "toEnvironmentMode");
  self->_floatingSwitcherVisible = objc_msgSend(v4, "toFloatingSwitcherVisible");
  objc_msgSend(v4, "toFloatingAppLayout");
  v8 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  floatingAppLayout = self->_floatingAppLayout;
  self->_floatingAppLayout = v8;

  self->_floatingConfiguration = objc_msgSend(v4, "toFloatingConfiguration");
  if (objc_msgSend(v4, "phase") == 1 && (objc_msgSend(v4, "isGestureInitiated") & 1) == 0)
  {
    v10 = objc_msgSend(v4, "fromWindowPickerRole") != 1 && objc_msgSend(v4, "toWindowPickerRole") == 1;
    v11 = objc_msgSend(v4, "fromWindowPickerRole") == 1 && objc_msgSend(v4, "toWindowPickerRole") != 1;
    v12 = objc_msgSend(v4, "fromWindowPickerRole") != 2 && objc_msgSend(v4, "toWindowPickerRole") == 2;
    v13 = objc_msgSend(v4, "fromWindowPickerRole") == 2 && objc_msgSend(v4, "toWindowPickerRole") != 2;
    v14 = v10 || v11 || v12 || v13;
    objc_msgSend(v4, "fromAppExposeBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toAppExposeBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = BSEqualStrings();

    objc_msgSend(v4, "fromAppLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toAppLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == v19
      && ((v20 = objc_msgSend(v4, "fromEnvironmentMode"), v20 != objc_msgSend(v4, "toEnvironmentMode"))
        ? (v21 = 1)
        : (v21 = v14),
          (v21 & 1) == 0))
    {

      v22 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
      if (v17)
        v22 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
    }
    else
    {

      v22 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
    }
    v23 = (SBSwitcherModifier *)*(id *)((char *)&self->super.super.super.isa + *v22);
    activeSubtree = self->_activeSubtree;
    self->_activeSubtree = v23;

  }
  v27.receiver = self;
  v27.super_class = (Class)SBMainSwitcherRoutingSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v27, sel_handleTransitionEvent_, v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "phase") == 1)
  {
    objc_msgSend(v4, "selectedAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "environment");
    v7 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
    if (v6 == 2)
      v7 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
    objc_storeStrong((id *)&self->_activeSubtree, *(id *)((char *)&self->super.super.super.isa + *v7));

  }
  v10.receiver = self;
  v10.super_class = (Class)SBMainSwitcherRoutingSwitcherModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v10, sel_handleGestureEvent_, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingAppLayout, 0);
  objc_storeStrong((id *)&self->_activeSubtree, 0);
  objc_storeStrong((id *)&self->_currentScrollableSubtree, 0);
  objc_storeStrong((id *)&self->_floatingModifierSubtree, 0);
  objc_storeStrong((id *)&self->_mainModifierSubtree, 0);
  objc_storeStrong((id *)&self->_routingModifier, 0);
}

@end
