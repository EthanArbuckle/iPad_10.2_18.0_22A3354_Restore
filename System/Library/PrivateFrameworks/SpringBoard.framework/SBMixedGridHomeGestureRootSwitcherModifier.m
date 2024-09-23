@implementation SBMixedGridHomeGestureRootSwitcherModifier

- (SBMixedGridHomeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 selectedAppLayout:(id)a4 mixedGridModifier:(id)a5
{
  id v10;
  id v11;
  SBMixedGridHomeGestureRootSwitcherModifier *v12;
  void *v14;
  objc_super v15;

  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBMixedGridHomeGestureRootSwitcherModifier;
  v12 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v15, sel_initWithStartingEnvironmentMode_, a3);
  if (v12)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBMixedGridHomeGestureRootSwitcherModifier.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mixedGridModifier"));

    }
    objc_storeStrong((id *)&v12->_selectedAppLayout, a4);
    objc_storeStrong((id *)&v12->_mixedGridModifier, a5);
  }

  return v12;
}

- (BOOL)completesWhenChildrenComplete
{
  return 0;
}

- (int64_t)gestureType
{
  return 1;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5;
  char isKindOfClass;

  if (a4)
  {
    self->_continuingGesture = 1;
    v5 = a4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    self->_lastGestureWasAnArcSwipe = isKindOfClass & 1;
  }
  return 0;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  SBAppLayout *v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  SBHomeGestureToMixedGridSwitcherSwitcherModifier *v22;
  void *v24;

  v6 = a3;
  objc_msgSend(v6, "transitionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "toEnvironmentMode");
  objc_msgSend(v6, "fromFloatingAppLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "fromFloatingConfiguration");

  v11 = self->_selectedAppLayout;
  v12 = -[SBGestureRootSwitcherModifier currentEnvironmentMode](self, "currentEnvironmentMode");
  if ((-[SBMixedGridHomeGestureRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled") & 1) != 0)
  {
    v14 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v15 = v13;
    v16 = *MEMORY[0x1E0C9D538];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMixedGridHomeGestureRootSwitcherModifier.m"), 88, CFSTR("If reduce motion is disabled, the gesture modifier should be an instance of SBHomeGestureSwitcherModifier"));

    }
    -[SBGestureSwitcherModifier isShowingOrAnimatingCardsForFlyIn](self->_gestureModifier, "isShowingOrAnimatingCardsForFlyIn");
    -[SBGestureSwitcherModifier liftOffVelocityForGestureEnd](self->_gestureModifier, "liftOffVelocityForGestureEnd");
    v16 = v17;
    v13 = v18;
    -[SBGestureSwitcherModifier liftOffTranslationForGestureEnd](self->_gestureModifier, "liftOffTranslationForGestureEnd");
    v14 = v19;
    v15 = v20;
  }
  if (v8 == 2)
  {
    v21 = -[SBMixedGridHomeGestureRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
    v22 = -[SBHomeGestureToMixedGridSwitcherSwitcherModifier initWithTransitionID:mixedGridModifier:selectedAppLayout:startingEnvironmentMode:liftOfVelocity:liftOffTranslation:floatingAppLayout:floatingConfiguration:]([SBHomeGestureToMixedGridSwitcherSwitcherModifier alloc], "initWithTransitionID:mixedGridModifier:selectedAppLayout:startingEnvironmentMode:liftOfVelocity:liftOffTranslation:floatingAppLayout:floatingConfiguration:", v7, v21, v11, v12, v9, v10, v16, v13, v14, v15);
    -[SBHomeGestureToMixedGridSwitcherSwitcherModifier setHidEventSenderID:](v22, "setHidEventSenderID:", -[SBGestureSwitcherModifierEvent hidEventSenderID](self->_lastGestureEvent, "hidEventSenderID"));

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)handleEvent:(id)a3
{
  id v4;
  void *v5;
  SBGestureSwitcherModifier *gestureModifier;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBMixedGridHomeGestureRootSwitcherModifier;
  -[SBGestureRootSwitcherModifier handleEvent:](&v16, sel_handleEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  gestureModifier = self->_gestureModifier;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SBMixedGridHomeGestureRootSwitcherModifier_handleEvent___block_invoke;
  v9[3] = &unk_1E8EA4CE8;
  v9[4] = self;
  v7 = v4;
  v10 = v7;
  v11 = &v12;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gestureModifier, v9);
  -[SBChainableModifier setState:](self->_gestureModifier, "setState:", v13[3]);
  if (!-[SBChainableModifier childModifierCount](self, "childModifierCount")
    && -[SBChainableModifier state](self->_gestureModifier, "state") == 1)
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }

  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __58__SBMixedGridHomeGestureRootSwitcherModifier_handleEvent___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t result;

  v2 = (id)objc_msgSend(*(id *)(a1[4] + 144), "handleEvent:", a1[5]);
  result = objc_msgSend(*(id *)(a1[4] + 144), "state");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)handleGestureEvent:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v8;
  uint64_t v9;
  SBAppLayout *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  SBReduceMotionHomeGestureSwitcherModifier *v15;
  id v16;
  SBHomeGestureSwitcherModifier *v17;
  SBGestureSwitcherModifier *gestureModifier;
  uint64_t v20;
  objc_super v21;

  v5 = a3;
  objc_storeStrong((id *)&self->_lastGestureEvent, a3);
  v21.receiver = self;
  v21.super_class = (Class)SBMixedGridHomeGestureRootSwitcherModifier;
  -[SBGestureRootSwitcherModifier handleGestureEvent:](&v21, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "phase") == 1)
  {
    v7 = objc_msgSend(v5, "gestureType");
    if (v7 == -[SBMixedGridHomeGestureRootSwitcherModifier gestureType](self, "gestureType"))
    {
      v8 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = self->_selectedAppLayout;
      v11 = -[SBGestureRootSwitcherModifier currentEnvironmentMode](self, "currentEnvironmentMode");
      v12 = objc_msgSend(v5, "type");
      objc_msgSend(v5, "gestureID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12 == 3;
      if (-[SBMixedGridHomeGestureRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled"))
      {
        v15 = -[SBReduceMotionHomeGestureSwitcherModifier initWithGestureID:selectedAppLayout:startingEnvironmentMode:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:]([SBReduceMotionHomeGestureSwitcherModifier alloc], "initWithGestureID:selectedAppLayout:startingEnvironmentMode:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:", v13, v10, v11, v14, self->_continuingGesture, self->_lastGestureWasAnArcSwipe);
        -[SBReduceMotionHomeGestureSwitcherModifier setShouldProvideBlur:](v15, "setShouldProvideBlur:", -[SBMixedGridHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1);
        -[SBReduceMotionHomeGestureSwitcherModifier setLaysOutNeighboringCards:](v15, "setLaysOutNeighboringCards:", -[SBMixedGridHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1);
      }
      else
      {
        v16 = -[SBMixedGridHomeGestureRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
        v17 = [SBHomeGestureSwitcherModifier alloc];
        LOBYTE(v20) = self->_lastGestureWasAnArcSwipe;
        v15 = -[SBHomeGestureSwitcherModifier initWithGestureID:selectedAppLayout:startingEnvironmentMode:multitaskingModifier:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:](v17, "initWithGestureID:selectedAppLayout:startingEnvironmentMode:multitaskingModifier:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:", v13, v10, v11, v16, v14, self->_continuingGesture, v20);

      }
      -[SBChainableModifier setDelegate:](v15, "setDelegate:", self);
      gestureModifier = self->_gestureModifier;
      self->_gestureModifier = &v15->super;

      v6 = (void *)v9;
    }
  }

  return v6;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 1;
}

- (BOOL)canTransitionWithoutGestureModifier
{
  return 1;
}

- (id)_newMultitaskingModifier
{
  return (id)-[SBMixedGridSwitcherProviding copy](self->_mixedGridModifier, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGestureEvent, 0);
  objc_storeStrong((id *)&self->_gestureModifier, 0);
  objc_storeStrong((id *)&self->_mixedGridModifier, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
}

@end
