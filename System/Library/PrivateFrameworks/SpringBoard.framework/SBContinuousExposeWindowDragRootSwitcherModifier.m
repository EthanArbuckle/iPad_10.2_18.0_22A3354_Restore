@implementation SBContinuousExposeWindowDragRootSwitcherModifier

- (SBContinuousExposeWindowDragRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 initialAppLayout:(id)a4
{
  id v7;
  SBContinuousExposeWindowDragRootSwitcherModifier *v8;
  SBContinuousExposeWindowDragRootSwitcherModifier *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
  v8 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v11, sel_initWithStartingEnvironmentMode_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_initialAppLayout, a4);

  return v9;
}

- (id)debugPotentialChildModifiers
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
  -[SBChainableModifier debugPotentialChildModifiers](&v7, sel_debugPotentialChildModifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__SBContinuousExposeWindowDragRootSwitcherModifier_debugPotentialChildModifiers__block_invoke;
  v6[3] = &unk_1E8EA51F0;
  v6[4] = self;
  objc_msgSend(v3, "bs_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__SBContinuousExposeWindowDragRootSwitcherModifier_debugPotentialChildModifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  id v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "gestureModifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqual:", v4))
  {

    goto LABEL_5;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    v6 = v3;
    goto LABEL_6;
  }
  objc_msgSend(v3, "modifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v7 = v6;

  return v7;
}

- (int64_t)gestureType
{
  return 8;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  SBContinuousExposeWindowDragContentSwitcherModifier *v8;
  void *v9;
  SBContinuousExposeWindowDragContentSwitcherModifier *v10;
  SBContinuousExposeWindowDragContainerSwitcherModifier *v11;
  void *v12;
  SBContinuousExposeWindowDragContainerSwitcherModifier *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemForLayoutRole:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [SBContinuousExposeWindowDragContentSwitcherModifier alloc];
  objc_msgSend(v5, "gestureID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBContinuousExposeWindowDragContentSwitcherModifier initWithGestureID:initialAppLayout:selectedDisplayItem:](v8, "initWithGestureID:initialAppLayout:selectedDisplayItem:", v9, self->_initialAppLayout, v7);
  v11 = [SBContinuousExposeWindowDragContainerSwitcherModifier alloc];
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SBContinuousExposeWindowDragContainerSwitcherModifier initWithAppLayouts:initialAppLayout:selectedDisplayItem:windowDragContentSwitcherModifier:](v11, "initWithAppLayouts:initialAppLayout:selectedDisplayItem:windowDragContentSwitcherModifier:", v12, self->_initialAppLayout, v7, v10);

  return v13;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v5;
  SBContinuousExposeWindowDropSwitcherModifier *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBContinuousExposeWindowDropSwitcherModifier *v11;

  v5 = a3;
  v6 = [SBContinuousExposeWindowDropSwitcherModifier alloc];
  objc_msgSend(v5, "transitionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemForLayoutRole:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toAppLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SBContinuousExposeWindowDropSwitcherModifier initWithTransitionID:selectedDisplayItem:toAppLayout:initialAppLayout:](v6, "initWithTransitionID:selectedDisplayItem:toAppLayout:initialAppLayout:", v7, v9, v10, self->_initialAppLayout);
  return v11;
}

- (id)handleGestureEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
  v3 = a3;
  -[SBGestureRootSwitcherModifier handleGestureEvent:](&v9, sel_handleGestureEvent_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "phase", v9.receiver, v9.super_class);

  if (v5 == 1)
  {
    v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
  -[SBGestureRootSwitcherModifier handleTransitionEvent:](&v11, sel_handleTransitionEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appLayoutByModifyingPreferredDisplayOrdinal:", -[SBContinuousExposeWindowDragRootSwitcherModifier displayOrdinal](self, "displayOrdinal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_initialAppLayout, v8);
  if (!v7)
  {

  }
  if (objc_msgSend(v5, "phase") == 1 && (objc_msgSend(v5, "isAppLaunchDuringWindowDragGestureTransition") & 1) == 0)
  {
    -[SBGestureRootSwitcherModifier gestureModifier](self, "gestureModifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setState:", 1);

  }
  if (objc_msgSend(v5, "phase") == 3 && (objc_msgSend(v5, "isAppLaunchDuringWindowDragGestureTransition") & 1) == 0)
    -[SBChainableModifier setState:](self, "setState:", 1);

  return v6;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *initialAppLayout;
  void *v7;
  SBUpdateLayoutSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v11, sel_handleSceneReadyEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  initialAppLayout = self->_initialAppLayout;
  objc_msgSend(v4, "appLayout", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(initialAppLayout) = -[SBAppLayout containsAllItemsFromAppLayout:](initialAppLayout, "containsAllItemsFromAppLayout:", v7);
  if ((_DWORD)initialAppLayout)
  {
    v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 0);
    SBAppendSwitcherModifierResponse(v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  return v5;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)keyboardSuppressionMode
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  if (-[SBContinuousExposeWindowDragRootSwitcherModifier isSoftwareKeyboardVisible](self, "isSoftwareKeyboardVisible"))
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
    -[SBContinuousExposeWindowDragRootSwitcherModifier appLayouts](&v8, sel_appLayouts);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:](SBSwitcherKeyboardSuppressionMode, "newSuppressionModeForSwitcherScenesFromAppLayouts:", v5);

    objc_msgSend(v6, "setApplyAssertionEvenIfAppIsHostingTheKeyboard:", 1);
    return v6;
  }
  else
  {
    +[SBSwitcherKeyboardSuppressionMode suppressionModeNone](SBSwitcherKeyboardSuppressionMode, "suppressionModeNone");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
}

@end
