@implementation SBGridSwipeUpGestureSwitcherModifier

- (SBGridSwipeUpGestureSwitcherModifier)initWithGestureID:(id)a3
{
  return -[SBGridSwipeUpGestureSwitcherModifier initWithGestureID:delayCompletionUntilTransitionBegins:](self, "initWithGestureID:delayCompletionUntilTransitionBegins:", a3, 0);
}

- (SBGridSwipeUpGestureSwitcherModifier)initWithGestureID:(id)a3 delayCompletionUntilTransitionBegins:(BOOL)a4
{
  SBGridSwipeUpGestureSwitcherModifier *v5;
  SBGridSwipeUpGestureSwitcherModifier *v6;
  SBDismissSiriSwitcherModifier *v7;
  SBDismissSiriSwitcherModifier *dismissSiriModifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  v5 = -[SBGestureSwitcherModifier initWithGestureID:](&v10, sel_initWithGestureID_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_delayCompletionUntilTransitionBegins = a4;
    v7 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v6->_dismissSiriModifier;
    v6->_dismissSiriModifier = v7;

    -[SBChainableModifier addChildModifier:](v6, "addChildModifier:", v6->_dismissSiriModifier);
  }
  return v6;
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
    -[SBGridSwipeUpGestureSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
}

- (CGRect)switcherViewBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  v17.receiver = self;
  v17.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  -[SBGridSwipeUpGestureSwitcherModifier switcherViewBounds](&v17, sel_switcherViewBounds);
  v4 = v3;
  v6 = v5;
  width = v7;
  height = v9;
  if (self->_isApplyingContentViewScaleToSwitcherViewBounds)
  {
    -[SBGridSwipeUpGestureSwitcherModifier contentViewScale](self, "contentViewScale");
    CGAffineTransformMakeScale(&v16, 1.0 / v11, 1.0 / v11);
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = width;
    v18.size.height = height;
    v19 = CGRectApplyAffineTransform(v18, &v16);
    width = v19.size.width;
    height = v19.size.height;
    v4 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v12 = v4;
  v13 = v6;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGPoint)scrollViewContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGAffineTransform v19;
  objc_super v20;
  objc_super v21;
  CGPoint result;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  -[SBGridSwipeUpGestureSwitcherModifier scrollViewContentOffset](&v21, sel_scrollViewContentOffset);
  v4 = v3;
  v6 = v5;
  if (self->_isApplyingContentViewScaleToSwitcherViewBounds)
  {
    v20.receiver = self;
    v20.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
    -[SBGridSwipeUpGestureSwitcherModifier switcherViewBounds](&v20, sel_switcherViewBounds);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    UIRectGetCenter();
    -[SBGridSwipeUpGestureSwitcherModifier contentViewScale](self, "contentViewScale");
    CGAffineTransformMakeScale(&v19, 1.0 / v15, 1.0 / v15);
    v23.origin.x = v8;
    v23.origin.y = v10;
    v23.size.width = v12;
    v23.size.height = v14;
    CGRectApplyAffineTransform(v23, &v19);
    SBUnintegralizedRectCenteredAboutPoint();
    v4 = v4 - (v8 - v16);
  }
  v17 = v4;
  v18 = v6;
  result.y = v18;
  result.x = v17;
  return result;
}

- (double)contentViewScale
{
  double v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  -[SBGridSwipeUpGestureSwitcherModifier switcherViewBounds](&v4, sel_switcherViewBounds);
  BSUIConstrainValueWithRubberBand();
  BSIntervalMap();
  return v2 * (*(double *)&kGridSwitcherSwipeUpMinimumScale + -1.0) + 1.0;
}

- (id)visibleAppLayouts
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__104;
  v9 = __Block_byref_object_dispose__104;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SBGridSwipeUpGestureSwitcherModifier_visibleAppLayouts__block_invoke;
  v4[3] = &unk_1E8E9DFA0;
  v4[4] = self;
  v4[5] = &v5;
  -[SBGridSwipeUpGestureSwitcherModifier _performBlockByApplyContentViewScaleToSwitcherViewBounds:](self, "_performBlockByApplyContentViewScaleToSwitcherViewBounds:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __57__SBGridSwipeUpGestureSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  objc_msgSendSuper2(&v5, sel_visibleAppLayouts);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)homeScreenBackdropBlurType
{
  return 2;
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

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  int64_t v8;
  SBMutableSwitcherTransitionRequest *v9;
  SBMutableSwitcherTransitionRequest *v10;
  void *v11;
  SBPerformTransitionSwitcherEventResponse *v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v15, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 2 || objc_msgSend(v4, "phase") == 3)
  {
    objc_msgSend(v4, "translationInContainerView");
    self->_translation.x = v6;
    self->_translation.y = v7;
    if (objc_msgSend(v4, "phase") == 3)
    {
      v8 = -[SBGridSwipeUpGestureSwitcherModifier finalResponseForGestureEvent:](self, "finalResponseForGestureEvent:", v4);
      v9 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      v10 = v9;
      if (v8)
      {
        -[SBSwitcherTransitionRequest setUnlockedEnvironmentMode:](v9, "setUnlockedEnvironmentMode:", 2);
      }
      else
      {
        +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSwitcherTransitionRequest setAppLayout:](v10, "setAppLayout:", v11);

      }
      v12 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v10, 1);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v12, v5);
      v13 = objc_claimAutoreleasedReturnValue();

      if (!-[SBGridSwipeUpGestureSwitcherModifier delayCompletionUntilTransitionBegins](self, "delayCompletionUntilTransitionBegins"))-[SBChainableModifier setState:](self, "setState:", 1);
      v5 = (void *)v13;
    }
  }

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v7, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBGridSwipeUpGestureSwitcherModifier delayCompletionUntilTransitionBegins](self, "delayCompletionUntilTransitionBegins")&& (unint64_t)objc_msgSend(v4, "phase") >= 2)
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }

  return v5;
}

- (int64_t)finalResponseForGestureEvent:(id)a3
{
  id v4;
  double v5;
  double v6;
  double y;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;

  v4 = a3;
  objc_msgSend(v4, "velocityInContainerView");
  v6 = v5;
  y = self->_translation.y;
  -[SBGridSwipeUpGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v9 = v8;
  v10 = objc_msgSend(v4, "isMouseEvent");

  if (v10)
  {
    -[SBGridSwipeUpGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v12 = v11 * 0.125;
  }
  else
  {
    v12 = v9 * 0.25;
  }
  return -(y - v6 * -0.15) <= v12;
}

- (void)_applyPrototypeSettings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  -[SBGridSwipeUpGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridSwitcherSwipeUpNormalizedRubberbandingRange");
  kGridSwitcherSwipeUpNormalizedRubberbandingRange = v2;
  objc_msgSend(v5, "gridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale");
  kGridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale = v3;
  objc_msgSend(v5, "gridSwitcherSwipeUpMinimumScale");
  kGridSwitcherSwipeUpMinimumScale = v4;

}

- (void)_performBlockByApplyContentViewScaleToSwitcherViewBounds:(id)a3
{
  self->_isApplyingContentViewScaleToSwitcherViewBounds = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_isApplyingContentViewScaleToSwitcherViewBounds = 0;
}

- (BOOL)delayCompletionUntilTransitionBegins
{
  return self->_delayCompletionUntilTransitionBegins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissSiriModifier, 0);
}

@end
