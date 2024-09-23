@implementation SBEntityRemovalToHomeSwitcherModifier

- (SBEntityRemovalToHomeSwitcherModifier)initWithTransitionID:(id)a3 homeAnimationDelay:(double)a4 multitaskingModifier:(id)a5
{
  id v9;
  SBEntityRemovalToHomeSwitcherModifier *v10;
  SBEntityRemovalToHomeSwitcherModifier *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
  v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v13, sel_initWithTransitionID_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_multitaskingModifier, a5);
    v11->_homeAnimationDelay = a4;
    v11->_canAnimateHomeScreenStyle = a4 <= 0.0;
  }

  return v11;
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)transitionWillUpdate
{
  void *v3;
  SBTimerEventSwitcherEventResponse *v4;
  double homeAnimationDelay;
  SBTimerEventSwitcherEventResponse *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  BOOL (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v15, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_canAnimateHomeScreenStyle)
  {
    objc_initWeak(&location, self);
    v4 = [SBTimerEventSwitcherEventResponse alloc];
    homeAnimationDelay = self->_homeAnimationDelay;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __61__SBEntityRemovalToHomeSwitcherModifier_transitionWillUpdate__block_invoke;
    v12 = &unk_1E8EA3468;
    objc_copyWeak(&v13, &location);
    v6 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v4, "initWithDelay:validator:reason:", &v9, CFSTR("kSBEntityRemovalToHomeSwitcherModifierHomeScreenLayoutReason"), homeAnimationDelay);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v3, v9, v10, v11, v12);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    v3 = (void *)v7;
  }
  return v3;
}

BOOL __61__SBEntityRemovalToHomeSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
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

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("kSBEntityRemovalToHomeSwitcherModifierHomeScreenLayoutReason"));
  if ((_DWORD)v4)
  {
    self->_canAnimateHomeScreenStyle = 1;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "switcherLayoutElementType", v10.receiver, v10.super_class);

  if (!v6)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    -[SBEntityRemovalToHomeSwitcherModifier _cornerRadiusSettings](self, "_cornerRadiusSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadiusSettings:", v8);

    v5 = v7;
  }
  return v5;
}

- (id)_cornerRadiusSettings
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DA9E08]);
  objc_msgSend(v2, "setResponse:", 0.0);
  return v2;
}

- (double)dockProgress
{
  return 1.0;
}

- (double)homeScreenScale
{
  double v3;
  double v4;
  SBSwitcherModifier *multitaskingModifier;
  objc_super v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout") || !self->_canAnimateHomeScreenStyle)
  {
    multitaskingModifier = self->_multitaskingModifier;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__SBEntityRemovalToHomeSwitcherModifier_homeScreenScale__block_invoke;
    v8[3] = &unk_1E8E9DFA0;
    v8[4] = self;
    v8[5] = &v9;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v8);
    v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
    -[SBEntityRemovalToHomeSwitcherModifier homeScreenScale](&v7, sel_homeScreenScale);
    v4 = v3;
    v10[3] = v3;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __56__SBEntityRemovalToHomeSwitcherModifier_homeScreenScale__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "homeScreenScale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)wallpaperScale
{
  double v3;
  double v4;
  SBSwitcherModifier *multitaskingModifier;
  objc_super v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout") || !self->_canAnimateHomeScreenStyle)
  {
    multitaskingModifier = self->_multitaskingModifier;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__SBEntityRemovalToHomeSwitcherModifier_wallpaperScale__block_invoke;
    v8[3] = &unk_1E8E9DFA0;
    v8[4] = self;
    v8[5] = &v9;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v8);
    v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
    -[SBEntityRemovalToHomeSwitcherModifier wallpaperScale](&v7, sel_wallpaperScale);
    v4 = v3;
    v10[3] = v3;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __55__SBEntityRemovalToHomeSwitcherModifier_wallpaperScale__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "wallpaperScale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)isWallpaperRequiredForSwitcher
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

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return 0;
}

- (BOOL)isContainerStatusBarVisible
{
  return self->_canAnimateHomeScreenStyle;
}

- (BOOL)isContentStatusBarVisible
{
  return !-[SBEntityRemovalToHomeSwitcherModifier isContainerStatusBarVisible](self, "isContainerStatusBarVisible");
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 1;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 1;
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return 1;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (-[SBEntityRemovalToHomeSwitcherModifier hasHomeButton](self, "hasHomeButton"))
    return 1;
  else
    return 3;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (double)homeScreenBackdropBlurProgress
{
  double v3;
  double v4;
  SBSwitcherModifier *multitaskingModifier;
  objc_super v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout") || !self->_canAnimateHomeScreenStyle)
  {
    multitaskingModifier = self->_multitaskingModifier;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__SBEntityRemovalToHomeSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke;
    v8[3] = &unk_1E8E9DFA0;
    v8[4] = self;
    v8[5] = &v9;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v8);
    v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
    -[SBEntityRemovalToHomeSwitcherModifier homeScreenBackdropBlurProgress](&v7, sel_homeScreenBackdropBlurProgress);
    v4 = v3;
    v10[3] = v3;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __71__SBEntityRemovalToHomeSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "homeScreenBackdropBlurProgress");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)homeScreenAlpha
{
  double v3;
  double v4;
  SBSwitcherModifier *multitaskingModifier;
  objc_super v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout") || !self->_canAnimateHomeScreenStyle)
  {
    multitaskingModifier = self->_multitaskingModifier;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__SBEntityRemovalToHomeSwitcherModifier_homeScreenAlpha__block_invoke;
    v8[3] = &unk_1E8E9DFA0;
    v8[4] = self;
    v8[5] = &v9;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v8);
    v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
    -[SBEntityRemovalToHomeSwitcherModifier homeScreenAlpha](&v7, sel_homeScreenAlpha);
    v4 = v3;
    v10[3] = v3;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __56__SBEntityRemovalToHomeSwitcherModifier_homeScreenAlpha__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "homeScreenAlpha");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)homeScreenDimmingAlpha
{
  double v3;
  double v4;
  SBSwitcherModifier *multitaskingModifier;
  objc_super v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout") || !self->_canAnimateHomeScreenStyle)
  {
    multitaskingModifier = self->_multitaskingModifier;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__SBEntityRemovalToHomeSwitcherModifier_homeScreenDimmingAlpha__block_invoke;
    v8[3] = &unk_1E8E9DFA0;
    v8[4] = self;
    v8[5] = &v9;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v8);
    v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
    -[SBEntityRemovalToHomeSwitcherModifier homeScreenDimmingAlpha](&v7, sel_homeScreenDimmingAlpha);
    v4 = v3;
    v10[3] = v3;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __63__SBEntityRemovalToHomeSwitcherModifier_homeScreenDimmingAlpha__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "homeScreenDimmingAlpha");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)dockUpdateMode
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
}

@end
