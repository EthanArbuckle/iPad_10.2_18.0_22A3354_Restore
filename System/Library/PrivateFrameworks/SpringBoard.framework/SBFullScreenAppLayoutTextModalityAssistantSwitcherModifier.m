@implementation SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier

- (SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier)initWithAppLayout:(id)a3 interfaceOrientation:(int64_t)a4 multitaskingModifier:(id)a5
{
  id v9;
  id v10;
  SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *v11;
  SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  v11 = -[SBSwitcherModifier init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appLayout, a3);
    v12->_interfaceOrientation = a4;
    objc_storeStrong((id *)&v12->_multitaskingModifier, a5);
  }

  return v12;
}

- (id)handleAssistantPresentationChangedEvent:(id)a3
{
  void *v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  uint64_t v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  -[SBSwitcherModifier handleAssistantPresentationChangedEvent:](&v10, sel_handleAssistantPresentationChangedEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait](self, "_isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait"))
  {
    v5 = [SBUpdateLayoutSwitcherEventResponse alloc];
  }
  else
  {
    v6 = -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier assistantPresentationState](self, "assistantPresentationState");
    v5 = [SBUpdateLayoutSwitcherEventResponse alloc];
    if (!v6)
    {
      v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:](v5, "initWithOptions:updateMode:", 8, 2);
      SBAppendSwitcherModifierResponse(v7, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBChainableModifier setState:](self, "setState:", 1);
      goto LABEL_6;
    }
  }
  v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:](v5, "initWithOptions:updateMode:", 28, 3);
  SBAppendSwitcherModifierResponse(v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v8;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v10, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fromInterfaceOrientation");
  v7 = objc_msgSend(v4, "toInterfaceOrientation");
  if (v7 != v6)
  {
    v8 = v7;
    if ((unint64_t)(v7 - 3) <= 1)
    {
      if (objc_msgSend(v4, "phase") == 2)
      {
        self->_interfaceOrientation = v8;
      }
      else if (objc_msgSend(v4, "phase") == 3)
      {
        -[SBChainableModifier setState:](self, "setState:", 1);
      }
    }
  }

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  SBMutableSwitcherAnimationAttributes *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "switcherLayoutElementType") || !objc_msgSend(v4, "isEqual:", self->_appLayout))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, v4);
    v5 = (SBMutableSwitcherAnimationAttributes *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
    -[SBSwitcherAnimationAttributes setUpdateMode:](v5, "setUpdateMode:", 3);
    -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier siriSettings](self, "siriSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemAssistantExperienceSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "typeToSiriPushInAnimationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherAnimationAttributes setScaleSettings:](v5, "setScaleSettings:", v8);

  }
  return v5;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  double result;
  BOOL v6;
  objc_super v7;

  if (!-[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAppLayoutAtIndex:](self, "_isAppLayoutAtIndex:")
    || (v6 = -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait](self, "_isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait"), result = 0.0, !v6))
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier backgroundOpacityForIndex:](&v7, sel_backgroundOpacityForIndex_, a3, result);
  }
  return result;
}

- (BOOL)isContainerStatusBarVisible
{
  objc_super v4;

  if (-[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait](self, "_isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  return -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier isContainerStatusBarVisible](&v4, sel_isContainerStatusBarVisible);
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  objc_super v6;

  if (-[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAppLayoutAtIndex:](self, "_isAppLayoutAtIndex:")
    && (-[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait](self, "_isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait")|| (unint64_t)(self->_interfaceOrientation - 3) < 2))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  return -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier isContentStatusBarVisibleForIndex:](&v6, sel_isContentStatusBarVisibleForIndex_, a3);
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  UIRectCornerRadii result;

  if (-[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAppLayoutAtIndex:](self, "_isAppLayoutAtIndex:"))
  {
    -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier cornerRadiiForIndex:](&v9, sel_cornerRadiiForIndex_, a3);
  }
  result.topRight = v8;
  result.bottomRight = v7;
  result.bottomLeft = v6;
  result.topLeft = v5;
  return result;
}

- (double)homeScreenAlpha
{
  SBSwitcherModifier *multitaskingModifier;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenAlpha__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __77__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenAlpha__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "homeScreenAlpha");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  SBSwitcherModifier *multitaskingModifier;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenBackdropBlurType__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __88__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenBackdropBlurType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "homeScreenBackdropBlurType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)homeScreenBackdropBlurProgress
{
  SBSwitcherModifier *multitaskingModifier;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __92__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "homeScreenBackdropBlurProgress");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)homeScreenDimmingAlpha
{
  SBSwitcherModifier *multitaskingModifier;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenDimmingAlpha__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __84__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenDimmingAlpha__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "homeScreenDimmingAlpha");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)homeScreenScale
{
  SBSwitcherModifier *multitaskingModifier;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenScale__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __77__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenScale__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "homeScreenScale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)isHomeScreenContentRequired
{
  SBSwitcherModifier *multitaskingModifier;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_isHomeScreenContentRequired__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __89__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_isHomeScreenContentRequired__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "isHomeScreenContentRequired");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_appLayout)
    && -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait](self, "_isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait"))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    v5 = -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier isResizeGrabberVisibleForAppLayout:](&v7, sel_isResizeGrabberVisibleForAppLayout_, v4);
  }

  return v5;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  SBSwitcherModifier *multitaskingModifier;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __92__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "isWallpaperRequiredForSwitcher");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  objc_super v6;

  if (-[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAppLayoutAtIndex:](self, "_isAppLayoutAtIndex:"))
    return 15;
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  return -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier maskedCornersForIndex:](&v6, sel_maskedCornersForIndex_, a3);
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if ((objc_msgSend(v6, "isEqual:", self->_appLayout) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    v7 = -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier shouldAllowContentViewTouchesForLayoutRole:inAppLayout:](&v9, sel_shouldAllowContentViewTouchesForLayoutRole_inAppLayout_, a3, v6);
  }

  return v7;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double result;
  objc_super v10;

  if (-[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAppLayoutAtIndex:](self, "_isAppLayoutAtIndex:")
    && -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait](self, "_isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait"))
  {
    -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier siriSettings](self, "siriSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemAssistantExperienceSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "typeToSiriPushInScale");
    v8 = v7;

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_, a3);
  }
  return result;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  SBSwitcherModifier *multitaskingModifier;
  double v4;
  _QWORD v6[7];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowOffsetForIndex___block_invoke;
  v6[3] = &unk_1E8E9FD08;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __83__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowOffsetForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 112), "shadowOffsetForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  SBSwitcherModifier *multitaskingModifier;
  double v5;
  _QWORD v7[8];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke;
  v7[3] = &unk_1E8E9FDD0;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __97__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 112), "shadowOpacityForLayoutRole:atIndex:", a1[6], a1[7]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  SBSwitcherModifier *multitaskingModifier;
  id v8;
  int64_t v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke;
  v11[3] = &unk_1E8E9FD80;
  v13 = &v15;
  v14 = a3;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __99__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 112), "shadowStyleForLayoutRole:inAppLayout:", a1[7], a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)visibleHomeAffordanceLayoutElements
{
  void *v3;
  objc_super v5;

  if (-[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait](self, "_isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier visibleHomeAffordanceLayoutElements](&v5, sel_visibleHomeAffordanceLayoutElements);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (double)wallpaperScale
{
  SBSwitcherModifier *multitaskingModifier;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_wallpaperScale__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __76__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_wallpaperScale__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "wallpaperScale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)wallpaperStyle
{
  SBSwitcherModifier *multitaskingModifier;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_wallpaperStyle__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __76__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_wallpaperStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "wallpaperStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isAppLayoutAtIndex:(unint64_t)a3
{
  SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_appLayout);

  return (char)v4;
}

- (BOOL)_isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait
{
  _BOOL4 v3;

  v3 = -[SBSwitcherModifier isAssistantEffectivelyPresentedForSAETypeToSiri](self, "isAssistantEffectivelyPresentedForSAETypeToSiri");
  if (v3)
    LOBYTE(v3) = (unint64_t)(self->_interfaceOrientation - 1) < 2;
  return v3;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (SBSwitcherModifier)multitaskingModifier
{
  return self->_multitaskingModifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
