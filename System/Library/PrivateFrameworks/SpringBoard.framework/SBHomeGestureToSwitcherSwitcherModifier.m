@implementation SBHomeGestureToSwitcherSwitcherModifier

- (SBHomeGestureToSwitcherSwitcherModifier)initWithTransitionID:(id)a3 multitaskingModifier:(id)a4 selectedAppLayout:(id)a5 startingEnvironmentMode:(int64_t)a6 liftOffVelocity:(CGPoint)a7 liftOffTranslation:(CGPoint)a8 adjustAppLayoutsBeforeTransition:(BOOL)a9 keepSelectedAppLayoutAsTopMostElement:(BOOL)a10
{
  CGFloat y;
  CGFloat x;
  CGFloat v14;
  CGFloat v15;
  id v21;
  id v22;
  SBHomeGestureToSwitcherSwitcherModifier *v23;
  SBHomeGestureToSwitcherSwitcherModifier *v24;
  objc_super v26;

  y = a8.y;
  x = a8.x;
  v14 = a7.y;
  v15 = a7.x;
  v21 = a4;
  v22 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
  v23 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v26, sel_initWithTransitionID_, a3);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_multitaskingModifier, a4);
    objc_storeStrong((id *)&v24->_selectedAppLayout, a5);
    v24->_startingEnvironmentMode = a6;
    v24->_liftOffVelocity.x = v15;
    v24->_liftOffVelocity.y = v14;
    v24->_liftOffTranslation.x = x;
    v24->_liftOffTranslation.y = y;
    v24->_adjustAppLayoutsBeforeTransition = a9;
    v24->_keepSelectedAppLayoutAsTopMostElement = a10;
    v24->_hidEventSenderID = 0;
  }

  return v24;
}

- (id)transitionWillBegin
{
  void *v3;
  SBSwitcherModifierEventResponse *v4;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v5;
  void *v6;
  SBScrollToAppLayoutSwitcherEventResponse *v7;
  SBUpdateLayoutSwitcherEventResponse *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  SBTimerEventSwitcherEventResponse *v15;
  void *v16;
  SBTimerEventSwitcherEventResponse *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v20, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  if (self->_adjustAppLayoutsBeforeTransition)
  {
    v5 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v5);

  }
  -[SBHomeGestureToSwitcherSwitcherModifier _appLayoutToScrollToDuringTransition](self, "_appLayoutToScrollToDuringTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v6, -[SBHomeGestureToSwitcherSwitcherModifier _appLayoutAlignmentToScrollToDuringTransition](self, "_appLayoutAlignmentToScrollToDuringTransition"), 0);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v7);

  }
  v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v8);

  -[SBHomeGestureToSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    -[SBHomeGestureToSwitcherSwitcherModifier switcherSettings](self, "switcherSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "emptySwitcherDismissDelay");
    v14 = v13;

    v15 = [SBTimerEventSwitcherEventResponse alloc];
    -[SBHomeGestureToSwitcherSwitcherModifier _dismissForEmptySwitcherResponseName](self, "_dismissForEmptySwitcherResponseName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v15, "initWithDelay:validator:reason:", 0, v16, v14);

    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v17);
  }
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  SBDismissForEmptySwitcherSwitcherEventResponse *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v11, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v11.receiver, v11.super_class);
  v6 = (SBDismissForEmptySwitcherSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();

  -[SBHomeGestureToSwitcherSwitcherModifier _dismissForEmptySwitcherResponseName](self, "_dismissForEmptySwitcherResponseName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBDismissForEmptySwitcherSwitcherEventResponse isEqualToString:](v6, "isEqualToString:", v7))
    goto LABEL_4;
  -[SBHomeGestureToSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    v6 = -[SBDismissForEmptySwitcherSwitcherEventResponse initWithHIDEventSenderID:]([SBDismissForEmptySwitcherSwitcherEventResponse alloc], "initWithHIDEventSenderID:", self->_hidEventSenderID);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v5);
    v7 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  }
  return v5;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  SBSwitcherModifier *multitaskingModifier;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[8];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  CGPoint result;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x3010000000;
  v13 = &unk_1D0FA064E;
  v14 = *MEMORY[0x1E0C9D538];
  multitaskingModifier = self->_multitaskingModifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SBHomeGestureToSwitcherSwitcherModifier_contentOffsetForIndex_alignment___block_invoke;
  v9[3] = &unk_1E8E9FDD0;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  v9[7] = a4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v9);
  v5 = v11[4];
  v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  v7 = v5;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

uint64_t __75__SBHomeGestureToSwitcherSwitcherModifier_contentOffsetForIndex_alignment___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1[4] + 144), "contentOffsetForIndex:alignment:", a1[6], a1[7]);
  v3 = *(_QWORD *)(a1[5] + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  SBSwitcherModifier *multitaskingModifier;
  id v6;
  objc_super v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (self->_adjustAppLayoutsBeforeTransition
    && -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__124;
    v16 = __Block_byref_object_dispose__124;
    v17 = 0;
    multitaskingModifier = self->_multitaskingModifier;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__SBHomeGestureToSwitcherSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
    v9[3] = &unk_1E8E9FD30;
    v11 = &v12;
    v9[4] = self;
    v10 = v4;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v9);
    v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
    -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v8, sel_adjustedAppLayoutsForAppLayouts_, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __75__SBHomeGestureToSwitcherSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 144), "adjustedAppLayoutsForAppLayouts:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)visibleAppLayouts
{
  SBSwitcherModifier *multitaskingModifier;
  id v4;
  objc_super v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__124;
    v12 = __Block_byref_object_dispose__124;
    v13 = 0;
    multitaskingModifier = self->_multitaskingModifier;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__SBHomeGestureToSwitcherSwitcherModifier_visibleAppLayouts__block_invoke;
    v7[3] = &unk_1E8E9DFA0;
    v7[4] = self;
    v7[5] = &v8;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v7);
    v4 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
    -[SBHomeGestureToSwitcherSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __60__SBHomeGestureToSwitcherSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "visibleAppLayouts");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBHomeGestureToSwitcherSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHomeGestureToSwitcherSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[SBHomeGestureToSwitcherSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled") & 1) != 0)
    objc_msgSend(v4, "reduceMotionAppToSwitcherSettings");
  else
    objc_msgSend(v4, "gestureInitiatedAppToSwitcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
  -[SBHomeGestureToSwitcherSwitcherModifier topMostLayoutElements](&v6, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_selectedAppLayout && self->_keepSelectedAppLayoutAsTopMostElement)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", self->_selectedAppLayout);
    objc_msgSend(v4, "insertObject:atIndex:", self->_selectedAppLayout, 0);

    v3 = v4;
  }
  return v3;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  __int128 v3;
  SBSwitcherModifier *multitaskingModifier;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[7];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  UIRectCornerRadii result;

  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x4010000000;
  v17 = &unk_1D0FA064E;
  v3 = *(_OWORD *)(MEMORY[0x1E0CEBAC0] + 16);
  v18 = *MEMORY[0x1E0CEBAC0];
  v19 = v3;
  multitaskingModifier = self->_multitaskingModifier;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__SBHomeGestureToSwitcherSwitcherModifier_cornerRadiiForIndex___block_invoke;
  v13[3] = &unk_1E8E9FD08;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a3;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v13);
  v5 = v15[4];
  v6 = v15[5];
  v7 = v15[6];
  v8 = v15[7];
  _Block_object_dispose(&v14, 8);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  result.topRight = v12;
  result.bottomRight = v11;
  result.bottomLeft = v10;
  result.topLeft = v9;
  return result;
}

uint64_t __63__SBHomeGestureToSwitcherSwitcherModifier_cornerRadiiForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 144), "cornerRadiiForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (double)containerStatusBarAnimationDuration
{
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[SBHomeGestureToSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 0.35;
  -[SBHomeGestureToSwitcherSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statusBarToApexBounceAnimationDuration");
  v9 = v8;

  return v9;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)appLayoutsToCacheSnapshots
{
  SBSwitcherModifier *multitaskingModifier;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__124;
  v10 = __Block_byref_object_dispose__124;
  v11 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__SBHomeGestureToSwitcherSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__SBHomeGestureToSwitcherSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "appLayoutsToCacheSnapshots");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  void *v9;
  NSRange v11;
  NSRange v12;

  -[SBHomeGestureToSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_selectedAppLayout)
  {
    v5 = objc_msgSend(v3, "indexOfObject:");
    if (v5)
    {
      v6 = v5 - 1;
      v7 = 3;
    }
    else
    {
      v6 = 0;
      v7 = 2;
    }
  }
  else
  {
    v6 = 0;
    v7 = 1;
  }
  v12.length = objc_msgSend(v4, "count");
  v11.location = v6;
  v11.length = v7;
  v12.location = 0;
  v8 = NSIntersectionRange(v11, v12);
  objc_msgSend(v4, "subarrayWithRange:", v8.location, v8.length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_appLayoutToScrollToDuringTransition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double x;
  _BOOL4 v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  -[SBHomeGestureToSwitcherSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "velocityXThresholdForUnconditionalArcSwipe");
  v5 = v4;
  v6 = SBMainScreenPointsPerMillimeter();
  -[SBHomeGestureToSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBHomeGestureToSwitcherSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
  v9 = v8;
  if (self->_startingEnvironmentMode != 1)
  {
    v14 = objc_msgSend(v7, "indexOfObject:", self->_selectedAppLayout);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
      goto LABEL_27;
    }
    v16 = v14;
    v17 = v5 * v6;
    -[SBHomeGestureToSwitcherSwitcherModifier containerViewBounds](self, "containerViewBounds");
    x = self->_liftOffVelocity.x;
    v20 = x > v17 || self->_liftOffTranslation.x > v18 * 0.5;
    if (x >= -v17 && self->_liftOffTranslation.x >= v18 * -0.5)
    {
      v22 = 0;
      v21 = v16 + v20;
      if ((v9 & 1) == 0)
      {
LABEL_14:
        if (v21)
          v23 = 0;
        else
          v23 = self->_startingEnvironmentMode == 3;
        v24 = (v22 | v20) ^ 1u;
        if (v23)
          v21 = v24;
      }
    }
    else
    {
      v21 = v16 - 1;
      v22 = 1;
      if ((v9 & 1) == 0)
        goto LABEL_14;
    }
    v25 = objc_msgSend(v7, "count");
    if (v25 - 1 >= (v21 & ~(v21 >> 63)))
      v26 = v21 & ~(v21 >> 63);
    else
      v26 = v25 - 1;
    objc_msgSend(v7, "objectAtIndex:", v26);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (!v8)
  {
    objc_msgSend(v7, "firstObject");
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v13 = (void *)v15;
    goto LABEL_27;
  }
  -[SBHomeGestureToSwitcherSwitcherModifier continuousExposeIdentifiersInSwitcher](self, "continuousExposeIdentifiersInSwitcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SBHomeGestureToSwitcherSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

LABEL_27:
  return v13;
}

- (int64_t)_appLayoutAlignmentToScrollToDuringTransition
{
  return 2 * (self->_startingEnvironmentMode != 1);
}

- (id)_dismissForEmptySwitcherResponseName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DismissForEmptySwitcher-%p"), self);
}

- (unint64_t)hidEventSenderID
{
  return self->_hidEventSenderID;
}

- (void)setHidEventSenderID:(unint64_t)a3
{
  self->_hidEventSenderID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
}

@end
