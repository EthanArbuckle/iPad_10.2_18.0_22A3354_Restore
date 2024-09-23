@implementation SBMedusaWindowDragGestureRootSwitcherModifier

- (SBMedusaWindowDragGestureRootSwitcherModifier)initWithSelectedLeafAppLayout:(id)a3 currentMainAppLayout:(id)a4 currentFloatingAppLayout:(id)a5 currentFloatingConfiguration:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  SBMedusaWindowDragGestureRootSwitcherModifier *v14;
  SBMedusaWindowDragGestureRootSwitcherModifier *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBMedusaWindowDragGestureRootSwitcherModifier;
  v14 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v17, sel_initWithStartingEnvironmentMode_, 3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_selectedLeafAppLayout, a3);
    objc_storeStrong((id *)&v15->_currentMainAppLayout, a4);
    objc_storeStrong((id *)&v15->_currentFloatingAppLayout, a5);
    v15->_currentFloatingConfiguration = a6;
  }

  return v15;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)gestureType
{
  return 8;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5;
  SBMedusaWindowDragGestureSwitcherModifier *v6;
  void *v7;
  SBMedusaWindowDragGestureSwitcherModifier *v8;

  v5 = a3;
  v6 = [SBMedusaWindowDragGestureSwitcherModifier alloc];
  objc_msgSend(v5, "gestureID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBMedusaWindowDragGestureSwitcherModifier initWithGestureID:selectedLeafAppLayout:initialMainAppLayout:initialFloatingAppLayout:initialFloatingConfiguration:](v6, "initWithGestureID:selectedLeafAppLayout:initialMainAppLayout:initialFloatingAppLayout:initialFloatingConfiguration:", v7, self->_selectedLeafAppLayout, self->_currentMainAppLayout, self->_currentFloatingAppLayout, self->_currentFloatingConfiguration);
  return v8;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SBMedusaWindowDragTransitionSwitcherModifier *v20;
  void *v21;
  SBAppLayout *selectedLeafAppLayout;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  SBMedusaWindowDragTransitionSwitcherModifier *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *v45;
  SBMedusaWindowDragGestureRootSwitcherModifier *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  SBMedusaWindowDragGestureRootSwitcherModifier *v54;
  id v55;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;
  v50 = v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromAppLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v15);

  objc_msgSend(v6, "fromFloatingAppLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v17);

  -[SBMedusaWindowDragGestureRootSwitcherModifier appLayouts](self, "appLayouts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __117__SBMedusaWindowDragGestureRootSwitcherModifier_transitionChildModifierForMainTransitionEvent_activeGestureModifier___block_invoke;
  v52[3] = &unk_1E8EA75C0;
  v48 = v18;
  v53 = v48;
  v54 = self;
  v51 = v12;
  v55 = v51;
  v49 = v13;
  objc_msgSend(v13, "bs_each:", v52);
  if ((objc_msgSend(v6, "isEnteringSlideOverPeekEvent") & 1) != 0)
    v19 = 1;
  else
    v19 = objc_msgSend(v6, "isEnteringSplitViewPeekEvent");
  v20 = [SBMedusaWindowDragTransitionSwitcherModifier alloc];
  objc_msgSend(v6, "transitionID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  selectedLeafAppLayout = self->_selectedLeafAppLayout;
  objc_msgSend(v6, "fromAppLayout");
  v47 = self;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toAppLayout");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toFloatingAppLayout");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toAppExposeBundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v11, "currentDestination");
  v28 = v11;
  v29 = v27;

  v30 = -[SBMedusaWindowDragTransitionSwitcherModifier initWithTransitionID:selectedAppLayout:fromAppLayout:toAppLayout:toFloatingAppLayout:toHomeScreenPeek:toAppExposeBundleIdentifier:initiallyBlurredDisplayItems:windowDragDestination:](v20, "initWithTransitionID:selectedAppLayout:fromAppLayout:toAppLayout:toFloatingAppLayout:toHomeScreenPeek:toAppExposeBundleIdentifier:initiallyBlurredDisplayItems:windowDragDestination:", v21, selectedLeafAppLayout, v23, v24, v25, v19, v26, v51, v29);
  if (SBPeekConfigurationIsValid(objc_msgSend(v6, "toPeekConfiguration")))
  {
    -[SBGestureRootSwitcherModifier selectedAppLayout](v47, "selectedAppLayout");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "environment") == 1)
    {
      objc_msgSend(v6, "toFloatingAppLayout");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "itemForLayoutRole:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "containsItem:", v33);

      if (v34)
      {
        objc_msgSend(v6, "toFloatingAppLayout");
        v35 = objc_claimAutoreleasedReturnValue();

        v31 = (void *)v35;
      }
    }
    if (objc_msgSend(v6, "isIconZoomDisabled"))
    {
      v36 = *MEMORY[0x1E0C9D628];
      v37 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
      v38 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
      v39 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
    }
    else
    {
      -[SBMedusaWindowDragGestureRootSwitcherModifier homeScreenIconFrameForAppLayout:](v47, "homeScreenIconFrameForAppLayout:", v31);
    }
    if (!CGRectIsNull(*(CGRect *)&v36)
      && (-[SBMedusaWindowDragGestureRootSwitcherModifier isReduceMotionEnabled](v47, "isReduceMotionEnabled") & 1) == 0)
    {
      -[SBAppLayout itemForLayoutRole:](v47->_selectedLeafAppLayout, "itemForLayoutRole:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "toAppLayout");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "containsItem:", v40);

      if (v42)
      {
        objc_msgSend(v6, "toAppLayout");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "leafAppLayoutForItem:", v40);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          v45 = -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier initWithAppLayout:gestureEdge:liftOffVelocity:]([SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier alloc], "initWithAppLayout:gestureEdge:liftOffVelocity:", v44, 1, v47->_gestureVelocity.x, v47->_gestureVelocity.y);
          -[SBChainableModifier addChildModifier:](v30, "addChildModifier:", v45);

        }
      }

    }
  }

  return v30;
}

void __117__SBMedusaWindowDragGestureRootSwitcherModifier_transitionChildModifierForMainTransitionEvent_activeGestureModifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __117__SBMedusaWindowDragGestureRootSwitcherModifier_transitionChildModifierForMainTransitionEvent_activeGestureModifier___block_invoke_2;
  v15[3] = &unk_1E8E9DF78;
  v5 = v3;
  v16 = v5;
  objc_msgSend(v4, "bs_filter:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(a1 + 40), "isLayoutRoleBlurred:inAppLayout:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "layoutRoleForItem:", v5), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10)))objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v8);
  }

}

uint64_t __117__SBMedusaWindowDragGestureRootSwitcherModifier_transitionChildModifierForMainTransitionEvent_activeGestureModifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  SBAppLayout *v5;
  SBAppLayout *currentMainAppLayout;
  SBAppLayout *v7;
  SBAppLayout *currentFloatingAppLayout;
  void *v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "phase") == 1)
  {
    objc_msgSend(v4, "toAppLayout");
    v5 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    currentMainAppLayout = self->_currentMainAppLayout;
    self->_currentMainAppLayout = v5;

    objc_msgSend(v4, "toFloatingAppLayout");
    v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    currentFloatingAppLayout = self->_currentFloatingAppLayout;
    self->_currentFloatingAppLayout = v7;

    self->_currentFloatingConfiguration = objc_msgSend(v4, "toFloatingConfiguration");
  }
  v11.receiver = self;
  v11.super_class = (Class)SBMedusaWindowDragGestureRootSwitcherModifier;
  -[SBGestureRootSwitcherModifier handleTransitionEvent:](&v11, sel_handleTransitionEvent_, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleGestureEvent:(id)a3
{
  CGPoint *p_gestureVelocity;
  id v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  objc_super v10;

  p_gestureVelocity = &self->_gestureVelocity;
  v5 = a3;
  objc_msgSend(v5, "velocityInContainerView");
  p_gestureVelocity->x = v6;
  p_gestureVelocity->y = v7;
  v10.receiver = self;
  v10.super_class = (Class)SBMedusaWindowDragGestureRootSwitcherModifier;
  -[SBGestureRootSwitcherModifier handleGestureEvent:](&v10, sel_handleGestureEvent_, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_currentMainAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedLeafAppLayout, 0);
}

@end
