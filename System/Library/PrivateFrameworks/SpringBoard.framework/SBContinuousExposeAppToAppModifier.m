@implementation SBContinuousExposeAppToAppModifier

- (SBContinuousExposeAppToAppModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 fromInterfaceOrientation:(int64_t)a5 toAppLayout:(id)a6 toInterfaceOrientation:(int64_t)a7 fromDisplayItemLayoutAttributesMap:(id)a8 toDisplayItemLayoutAttributesMap:(id)a9
{
  id v15;
  id v16;
  id v17;
  SBContinuousExposeAppToAppModifier *v18;
  SBContinuousExposeAppToAppModifier *v19;
  NSArray *displayItemsChangingSize;
  uint64_t v21;
  SBDisplayItem *fromTopMostDisplayItem;
  uint64_t v23;
  SBDisplayItem *toTopMostDisplayItem;
  void *v25;
  uint64_t v26;
  NSString *uniqueAnimationIdentifier;
  void *v29;
  void *v30;
  id v32;
  id v33;
  objc_super v34;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v33 = a8;
  v32 = a9;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeAppToAppModifier.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeAppToAppModifier.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

LABEL_3:
  v34.receiver = self;
  v34.super_class = (Class)SBContinuousExposeAppToAppModifier;
  v18 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v34, sel_initWithTransitionID_, v15);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fromAppLayout, a4);
    v19->_fromInterfaceOrientation = a5;
    objc_storeStrong((id *)&v19->_toAppLayout, a6);
    v19->_toInterfaceOrientation = a7;
    objc_storeStrong((id *)&v19->_fromDisplayItemLayoutAttributesMap, a8);
    objc_storeStrong((id *)&v19->_toDisplayItemLayoutAttributesMap, a9);
    displayItemsChangingSize = v19->_displayItemsChangingSize;
    v19->_displayItemsChangingSize = (NSArray *)MEMORY[0x1E0C9AA60];

    -[SBContinuousExposeAppToAppModifier _topMostDisplayItemInDisplayItemLayoutAttributesMap:](v19, "_topMostDisplayItemInDisplayItemLayoutAttributesMap:", v19->_fromDisplayItemLayoutAttributesMap);
    v21 = objc_claimAutoreleasedReturnValue();
    fromTopMostDisplayItem = v19->_fromTopMostDisplayItem;
    v19->_fromTopMostDisplayItem = (SBDisplayItem *)v21;

    -[SBContinuousExposeAppToAppModifier _topMostDisplayItemInDisplayItemLayoutAttributesMap:](v19, "_topMostDisplayItemInDisplayItemLayoutAttributesMap:", v19->_toDisplayItemLayoutAttributesMap);
    v23 = objc_claimAutoreleasedReturnValue();
    toTopMostDisplayItem = v19->_toTopMostDisplayItem;
    v19->_toTopMostDisplayItem = (SBDisplayItem *)v23;

    v19->_ignoreTapsDuringMorphTransition = 1;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = objc_claimAutoreleasedReturnValue();
    uniqueAnimationIdentifier = v19->_uniqueAnimationIdentifier;
    v19->_uniqueAnimationIdentifier = (NSString *)v26;

  }
  return v19;
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v5;
  NSArray *v6;
  NSArray *displayItemsChangingSize;
  NSMutableArray *v8;
  NSMutableArray *pendingDisplayItemSceneUpdates;
  void *v10;
  int v11;
  SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *v19;
  _QWORD v20[5];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBContinuousExposeAppToAppModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v21, sel_didMoveToParentModifier_);
  if (a3)
  {
    -[SBAppLayout allItems](self->_toAppLayout, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__SBContinuousExposeAppToAppModifier_didMoveToParentModifier___block_invoke;
    v20[3] = &unk_1E8E9DF50;
    v20[4] = self;
    objc_msgSend(v5, "bs_filter:", v20);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    displayItemsChangingSize = self->_displayItemsChangingSize;
    self->_displayItemsChangingSize = v6;

    v8 = (NSMutableArray *)-[NSArray mutableCopy](self->_displayItemsChangingSize, "mutableCopy");
    pendingDisplayItemSceneUpdates = self->_pendingDisplayItemSceneUpdates;
    self->_pendingDisplayItemSceneUpdates = v8;

    if (!-[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", self->_fromAppLayout))
    {
      if (self->_toAppLayout)
      {
        -[SBContinuousExposeAppToAppModifier appLayouts](self, "appLayouts");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", self->_toAppLayout);

        if (v11)
        {
          if (-[SBContinuousExposeAppToAppModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled")&& !-[SBContinuousExposeAppToAppModifier isTopAffordanceMenuTransition](self, "isTopAffordanceMenuTransition")|| -[SBContinuousExposeAppToAppModifier isCommandTabTransition](self, "isCommandTabTransition")|| -[SBContinuousExposeAppToAppModifier isLaunchingFromDockTransition](self, "isLaunchingFromDockTransition")|| -[SBContinuousExposeAppToAppModifier isLaunchingFromSpotlightTransition](self, "isLaunchingFromSpotlightTransition"))
          {
            v12 = [SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier alloc];
            -[SBTransitionSwitcherModifier transitionID](self, "transitionID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier initWithTransitionID:toAppLayout:fromAppLayout:](v12, "initWithTransitionID:toAppLayout:fromAppLayout:", v13, self->_toAppLayout, self->_fromAppLayout);
          }
          else
          {
            -[SBContinuousExposeAppToAppModifier switcherSettings](self, "switcherSettings");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "chamoisSettings");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "useLowFatigueStripAnimation");

            if (!v18)
              return;
            v19 = [SBContinuousExposeFullScreenToStripTransitionSwitcherModifier alloc];
            -[SBTransitionSwitcherModifier transitionID](self, "transitionID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier initWithTransitionID:outgoingAppLayout:](v19, "initWithTransitionID:outgoingAppLayout:", v13, self->_fromAppLayout);
          }
          v15 = (void *)v14;

          if (v15)
          {
            -[SBChainableModifier addChildModifier:](self, "addChildModifier:", v15);

          }
        }
      }
    }
  }
}

uint64_t __62__SBContinuousExposeAppToAppModifier_didMoveToParentModifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  double v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  uint64_t v33;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "containsItem:", v3))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isContinuousExposeConfigurationChangeTransition") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectForKey:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "objectForKey:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "chamoisLayoutAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "containerViewBounds");
      if (v5 == v6)
        goto LABEL_12;
      v12 = v8;
      v13 = v9;
      v14 = v10;
      v15 = v11;
      objc_msgSend(v7, "defaultWindowSize");
      v17 = v16;
      v19 = v18;
      objc_msgSend(v7, "screenEdgePadding");
      objc_msgSend(v5, "sizeInBounds:defaultSize:screenEdgePadding:", v12, v13, v14, v15, v17, v19, v20);
      v22 = v21;
      v24 = v23;
      objc_msgSend(v7, "defaultWindowSize");
      v26 = v25;
      v28 = v27;
      objc_msgSend(v7, "screenEdgePadding");
      objc_msgSend(v6, "sizeInBounds:defaultSize:screenEdgePadding:", v12, v13, v14, v15, v26, v28, v29);
      v32 = v22 == v31 && v24 == v30;
      if (v32 && (v33 = objc_msgSend(v5, "sizingPolicy"), v33 == objc_msgSend(v6, "sizingPolicy")))
LABEL_12:
        v4 = 0;
      else
        v4 = 1;

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)asyncRenderingDisabled
{
  return (BSEqualObjects() & 1) != 0
      || -[SBAppLayout containsAllItemsFromAppLayout:](self->_fromAppLayout, "containsAllItemsFromAppLayout:", self->_toAppLayout);
}

- (id)transitionWillBegin
{
  SBUpdateLayoutSwitcherEventResponse *v3;
  uint64_t v4;
  void *v5;
  NSDictionary *toDisplayItemLayoutAttributesMap;
  SBTimerEventSwitcherEventResponse *v7;
  double v8;
  void *v9;
  SBTimerEventSwitcherEventResponse *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id location;
  double v18;
  _QWORD v19[6];
  objc_super v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__40;
  v25 = __Block_byref_object_dispose__40;
  v20.receiver = self;
  v20.super_class = (Class)SBContinuousExposeAppToAppModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v20, sel_transitionWillBegin);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  SBAppendSwitcherModifierResponse(v3, v22[5]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v22[5];
  v22[5] = v4;

  if (-[SBContinuousExposeAppToAppModifier isTopAffordanceMenuTransition](self, "isTopAffordanceMenuTransition"))
  {
    toDisplayItemLayoutAttributesMap = self->_toDisplayItemLayoutAttributesMap;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__SBContinuousExposeAppToAppModifier_transitionWillBegin__block_invoke;
    v19[3] = &unk_1E8EABA00;
    v19[4] = self;
    v19[5] = &v21;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](toDisplayItemLayoutAttributesMap, "enumerateKeysAndObjectsUsingBlock:", v19);
  }
  v18 = 0.0;
  if (-[SBContinuousExposeAppToAppModifier _shouldIgnoreTapsUntilDelay:](self, "_shouldIgnoreTapsUntilDelay:", &v18))
  {
    objc_initWeak(&location, self);
    v7 = [SBTimerEventSwitcherEventResponse alloc];
    v8 = v18;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__SBContinuousExposeAppToAppModifier_transitionWillBegin__block_invoke_2;
    v15[3] = &unk_1E8EA3468;
    objc_copyWeak(&v16, &location);
    -[SBContinuousExposeAppToAppModifier _ignoreTapsDuringMorphTransitionReason](self, "_ignoreTapsDuringMorphTransitionReason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v7, "initWithDelay:validator:reason:", v15, v9, v8);

    SBAppendSwitcherModifierResponse(v10, v22[5]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v22[5];
    v22[5] = v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __57__SBContinuousExposeAppToAppModifier_transitionWillBegin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  SBSetInterfaceOrientationFromUserResizingEventResponse *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _OWORD v14[3];
  uint64_t v15;
  _BYTE v16[56];

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "attributedSize");
    if (v6)
    {
      objc_msgSend(v6, "attributedSize");
      if ((SBEqualDisplayItemAttributedSizes((uint64_t)v16, (uint64_t)v14) & 1) == 0)
      {
        objc_msgSend(v6, "attributedSize");
        if (v13 == 3)
        {
          v9 = -[SBSetInterfaceOrientationFromUserResizingEventResponse initWithDisplayItem:desiredContentOrientation:]([SBSetInterfaceOrientationFromUserResizingEventResponse alloc], "initWithDisplayItem:desiredContentOrientation:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
          SBAppendSwitcherModifierResponse(v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = *(void **)(v11 + 40);
          *(_QWORD *)(v11 + 40) = v10;

        }
      }
    }
    else
    {
      v15 = 0;
      memset(v14, 0, sizeof(v14));
      SBEqualDisplayItemAttributedSizes((uint64_t)v16, (uint64_t)v14);
    }
  }

}

BOOL __57__SBContinuousExposeAppToAppModifier_transitionWillBegin__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "parentModifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)transitionDidEnd
{
  void *v3;
  SBCancelWindowMorphingSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeAppToAppModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v7, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBTransitionSwitcherModifier isInterrupted](self, "isInterrupted"))
  {
    v4 = objc_alloc_init(SBCancelWindowMorphingSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBUpdateLayoutSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposeAppToAppModifier;
  v4 = a3;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v12, sel_handleSceneReadyEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "itemForLayoutRole:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray containsObject:](self->_pendingDisplayItemSceneUpdates, "containsObject:", v7))
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeAppToAppModifier;
    if (-[SBContinuousExposeAppToAppModifier isLayoutRoleContentReady:inAppLayout:](&v11, sel_isLayoutRoleContentReady_inAppLayout_, objc_msgSend(v6, "layoutRoleForItem:", v7), v6))-[NSMutableArray removeObject:](self->_pendingDisplayItemSceneUpdates, "removeObject:", v7);
  }
  if (-[NSArray containsObject:](self->_displayItemsChangingSize, "containsObject:", v7))
  {
    v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 0);
    SBAppendSwitcherModifierResponse(v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }

  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  void *v13;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  SBCancelWindowMorphingSwitcherEventResponse *v19;
  void *v20;
  objc_super v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SBContinuousExposeAppToAppModifier isMorphFromInAppViewTransition](self, "isMorphFromInAppViewTransition"))
  {
LABEL_10:
    v21.receiver = self;
    v21.super_class = (Class)SBContinuousExposeAppToAppModifier;
    -[SBSwitcherModifier handleTapAppLayoutEvent:](&v21, sel_handleTapAppLayoutEvent_, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (self->_ignoreTapsDuringMorphTransition)
  {
    SBLogAppSwitcher();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignored tap event because of ignore tap assertion", buf, 0xCu);

    }
    objc_msgSend(v4, "handleWithReason:", CFSTR("Continuous Exposé App to App"));
    goto LABEL_10;
  }
  v8 = objc_msgSend(v4, "isHandled");
  SBLogAppSwitcher();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] tap detected but it has been handled already", buf, 0xCu);

    }
    goto LABEL_10;
  }
  if (v10)
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "succinctDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v16;
    v25 = 2114;
    v26 = v18;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] tap detected, cancelling any window morphing before transition completes: %{public}@", buf, 0x16u);

  }
  v19 = objc_alloc_init(SBCancelWindowMorphingSwitcherEventResponse);
  v22.receiver = self;
  v22.super_class = (Class)SBContinuousExposeAppToAppModifier;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v22, sel_handleTapAppLayoutEvent_, v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SBAppendSwitcherModifierResponse(v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v13;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeAppToAppModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v13, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v13.receiver, v13.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBContinuousExposeAppToAppModifier _ignoreTapsDuringMorphTransitionReason](self, "_ignoreTapsDuringMorphTransitionReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    SBLogAppSwitcher();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "[%{public}@] handling ignore tap assertion event", buf, 0xCu);

    }
    self->_ignoreTapsDuringMorphTransition = 0;
  }
  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  CAFrameRateRange v19;
  CAFrameRateRange v20;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBContinuousExposeAppToAppModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v18, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v4, "switcherLayoutElementType"))
    goto LABEL_15;
  if (!BSEqualObjects())
    goto LABEL_15;
  if ((BSEqualObjects() & 1) != 0)
    goto LABEL_15;
  if (!self->_fromAppLayout)
    goto LABEL_15;
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[SBAppLayout allItems](self->_toAppLayout, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  -[SBAppLayout allItems](self->_fromAppLayout, "allItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = BSEqualSets();

  if (v13)
  {
    objc_msgSend(v6, "setLayoutUpdateMode:", 3);
    -[SBContinuousExposeAppToAppModifier switcherSettings](self, "switcherSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chamoisSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stageFocusChangeSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutSettings:", v16);

  }
  else
  {
LABEL_15:
    if (objc_msgSend(v4, "switcherLayoutElementType") || (BSEqualObjects() & 1) != 0 || BSEqualObjects())
    {
      objc_msgSend(v6, "setLayoutUpdateMode:", 3);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
      objc_msgSend(v14, "setResponse:", 0.4);
      objc_msgSend(v14, "setDampingRatio:", 1.0);
      v19 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      objc_msgSend(v14, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);
      objc_msgSend(v6, "setLayoutSettings:", v14);
    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
      objc_msgSend(v14, "setResponse:", 0.54);
      objc_msgSend(v14, "setDampingRatio:", 0.92);
      v20 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      objc_msgSend(v14, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v20.minimum, *(double *)&v20.maximum, *(double *)&v20.preferred);
      objc_msgSend(v6, "setLayoutSettings:", v14);
      objc_msgSend(v6, "setPositionSettings:", v14);
      objc_msgSend(v6, "setOpacitySettings:", v14);
      objc_msgSend(v6, "setUpdateMode:", 3);
    }
  }

  return v6;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  char v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeAppToAppModifier;
  -[SBContinuousExposeAppToAppModifier topMostLayoutElements](&v13, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout leafAppLayoutForRole:](self->_fromAppLayout, "leafAppLayoutForRole:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout leafAppLayoutForRole:](self->_toAppLayout, "leafAppLayoutForRole:", 4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (v4)
      v8 = v5 == 0;
    else
      v8 = 0;
    if (v8)
    {
      objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v4, 0);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_14:

      v3 = (void *)v9;
    }
  }
  else
  {
    v10 = objc_msgSend(v4, "isEqual:", v5);
    if ((v10 & 1) == 0)
    {
      objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v4, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "sb_arrayByInsertingOrMovingObject:toIndex:", v6, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v3 = v11;
      goto LABEL_14;
    }
  }

  return v3;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  v9 = 0.0;
  if (!-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeAppToAppModifier;
    -[SBContinuousExposeAppToAppModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqual:", self->_toAppLayout)
    || (v5 = 0.0, -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") != 1))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeAppToAppModifier;
    -[SBContinuousExposeAppToAppModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
    v5 = v6;
  }

  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeAppToAppModifier;
  if (-[SBContinuousExposeAppToAppModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v10, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6))
  {
    goto LABEL_2;
  }
  if (!objc_msgSend(v6, "isEqual:", self->_toAppLayout))
  {
    v7 = 0;
    goto LABEL_7;
  }
  if (-[SBContinuousExposeAppToAppModifier isContinuousExposeConfigurationChangeTransition](self, "isContinuousExposeConfigurationChangeTransition"))
  {
LABEL_2:
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "itemForLayoutRole:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSArray containsObject:](self->_displayItemsChangingSize, "containsObject:", v8);

  }
LABEL_7:

  return v7;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a4;
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray containsObject:](self->_displayItemsChangingSize, "containsObject:", v7)
    && -[NSMutableArray containsObject:](self->_pendingDisplayItemSceneUpdates, "containsObject:", v7))
  {
    LODWORD(a3) = !-[SBContinuousExposeAppToAppModifier isMorphFromInAppViewTransition](self, "isMorphFromInAppViewTransition");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeAppToAppModifier;
    LOBYTE(a3) = -[SBContinuousExposeAppToAppModifier isLayoutRoleBlurred:inAppLayout:](&v9, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  }

  return a3;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v6 = a4;
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)SBContinuousExposeAppToAppModifier;
  -[SBContinuousExposeAppToAppModifier blurDelayForLayoutRole:inAppLayout:](&v14, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v9 = v8;

  if (-[NSArray containsObject:](self->_displayItemsChangingSize, "containsObject:", v7)
    && !-[SBContinuousExposeAppToAppModifier isMorphFromInAppViewTransition](self, "isMorphFromInAppViewTransition"))
  {
    -[SBContinuousExposeAppToAppModifier switcherSettings](self, "switcherSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "animationSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resizeBlurDelay");
    v9 = v12;

  }
  return v9;
}

- (id)_layoutSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBContinuousExposeAppToAppModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chamoisSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appToAppLayoutSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldIgnoreTapsUntilDelay:(double *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  float v10;

  v5 = -[SBContinuousExposeAppToAppModifier isMorphFromInAppViewTransition](self, "isMorphFromInAppViewTransition");
  if (v5)
  {
    -[SBContinuousExposeAppToAppModifier switcherSettings](self, "switcherSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableTapDuringMorphFromInAppViewTransitionDelay");
    v9 = v8;
    UIAnimationDragCoefficient();
    *a3 = v9 * v10;

  }
  return v5;
}

- (id)_ignoreTapsDuringMorphTransitionReason
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-IgnoreTapsDuringMorphTransitionReason"), self->_uniqueAnimationIdentifier);
}

- (id)_topMostDisplayItemInDisplayItemLayoutAttributesMap:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "lastInteractionTime");
        if (v13 > v7)
        {
          v14 = v13;
          v15 = v11;

          v7 = v14;
          v8 = v15;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (int64_t)fromInterfaceOrientation
{
  return self->_fromInterfaceOrientation;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (int64_t)toInterfaceOrientation
{
  return self->_toInterfaceOrientation;
}

- (NSDictionary)fromDisplayItemLayoutAttributesMap
{
  return self->_fromDisplayItemLayoutAttributesMap;
}

- (NSDictionary)toDisplayItemLayoutAttributesMap
{
  return self->_toDisplayItemLayoutAttributesMap;
}

- (BOOL)isContinuousExposeConfigurationChangeTransition
{
  return self->_continuousExposeConfigurationChangeTransition;
}

- (void)setContinuousExposeConfigurationChangeTransition:(BOOL)a3
{
  self->_continuousExposeConfigurationChangeTransition = a3;
}

- (BOOL)isCommandTabTransition
{
  return self->_commandTabTransition;
}

- (void)setCommandTabTransition:(BOOL)a3
{
  self->_commandTabTransition = a3;
}

- (BOOL)isLaunchingFromDockTransition
{
  return self->_launchingFromDockTransition;
}

- (void)setLaunchingFromDockTransition:(BOOL)a3
{
  self->_launchingFromDockTransition = a3;
}

- (BOOL)isMorphFromInAppViewTransition
{
  return self->_morphFromInAppViewTransition;
}

- (void)setMorphFromInAppViewTransition:(BOOL)a3
{
  self->_morphFromInAppViewTransition = a3;
}

- (BOOL)isLaunchingFromSpotlightTransition
{
  return self->_launchingFromSpotlightTransition;
}

- (void)setLaunchingFromSpotlightTransition:(BOOL)a3
{
  self->_launchingFromSpotlightTransition = a3;
}

- (BOOL)isTopAffordanceMenuTransition
{
  return self->_isTopAffordanceMenuTransition;
}

- (void)setIsTopAffordanceMenuTransition:(BOOL)a3
{
  self->_isTopAffordanceMenuTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toDisplayItemLayoutAttributesMap, 0);
  objc_storeStrong((id *)&self->_fromDisplayItemLayoutAttributesMap, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_uniqueAnimationIdentifier, 0);
  objc_storeStrong((id *)&self->_toTopMostDisplayItem, 0);
  objc_storeStrong((id *)&self->_fromTopMostDisplayItem, 0);
  objc_storeStrong((id *)&self->_pendingDisplayItemSceneUpdates, 0);
  objc_storeStrong((id *)&self->_displayItemsChangingSize, 0);
}

@end
