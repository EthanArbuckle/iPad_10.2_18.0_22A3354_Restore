@implementation SBShelfExpansionSwitcherModifier

- (SBShelfExpansionSwitcherModifier)initWithTransitionID:(id)a3 expand:(BOOL)a4 style:(unint64_t)a5 target:(CGPoint)a6 animationDelegate:(id)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  SBShelfExpansionSwitcherModifier *v14;
  SBShelfExpansionSwitcherModifier *v15;
  CGSize v16;
  CGPoint v17;
  NSArray *topMostLayoutElements_lastElements;
  objc_super v20;

  y = a6.y;
  x = a6.x;
  v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SBShelfExpansionSwitcherModifier;
  v14 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v20, sel_initWithTransitionID_, a3);
  v15 = v14;
  if (v14)
  {
    v14->_expand = a4;
    v14->_target.x = x;
    v14->_target.y = y;
    v14->_style = a5;
    objc_storeWeak((id *)&v14->_animationDelegate, v13);
    v15->_topMostLayoutElements_lastAppLayoutsGenCount = 0x7FFFFFFFFFFFFFFFLL;
    v15->_topMostLayoutElements_lastOrientation = 0;
    v17 = (CGPoint)*MEMORY[0x1E0C9D628];
    v16 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v15->_topMostLayoutElements_lastContainerViewBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v15->_topMostLayoutElements_lastContainerViewBounds.size = v16;
    v15->_topMostLayoutElements_lastSwitcherViewBounds.origin = v17;
    v15->_topMostLayoutElements_lastSwitcherViewBounds.size = v16;
    v15->_topMostLayoutElements_lastContentOffset = (CGPoint)SBInvalidPoint;
    topMostLayoutElements_lastElements = v15->_topMostLayoutElements_lastElements;
    v15->_topMostLayoutElements_lastElements = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v15;
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v5;
  void *v6;
  SBFFluidBehaviorSettings *v7;
  SBFFluidBehaviorSettings *ropeSettings;
  double v9;
  double v10;
  SBFFluidBehaviorSettings *v11;
  SBFFluidBehaviorSettings *v12;
  SBFFluidBehaviorSettings *v13;
  double v14;
  double v15;
  SBFFluidBehaviorSettings *v16;
  SBFFluidBehaviorSettings *settings;
  double v18;
  double v19;
  double v20;
  double v21;
  SBFFluidBehaviorSettings *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SBShelfExpansionSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v23, sel_didMoveToParentModifier_);
  if (a3)
  {
    -[SBShelfExpansionSwitcherModifier medusaSettings](self, "medusaSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_style == 1)
    {
      objc_msgSend(v5, "switcherShelfGenieRopeSettings");
      v7 = (SBFFluidBehaviorSettings *)objc_claimAutoreleasedReturnValue();
      ropeSettings = self->_ropeSettings;
      self->_ropeSettings = v7;

      objc_msgSend(v6, "switcherShelfCardGenieDismissedScale");
      self->_dismissalScale = v9;
      objc_msgSend(v6, "switcherShelfCardGenieResponseIncrementScalar");
      self->_perIndexResponseIncrement = v10;
      if (self->_expand)
        objc_msgSend(v6, "switcherShelfCardGeniePresentationSettings");
      else
        objc_msgSend(v6, "switcherShelfCardGenieDismissalSettings");
      v11 = (SBFFluidBehaviorSettings *)objc_claimAutoreleasedReturnValue();
      settings = self->_settings;
      self->_settings = v11;

      objc_msgSend(v6, "switcherShelfGenieBezierCurvePointYDeltaFromTarget");
      self->_bezierCurvePointYDeltaFromTarget = v18;
      objc_msgSend(v6, "switcherShelfGenieBezierCurveXExponent");
      self->_bezierCurveXExponent = v19;
      objc_msgSend(v6, "switcherShelfGenieBezierCurveYExponent");
      self->_bezierCurveYExponent = v20;
      objc_msgSend(v6, "switcherShelfGenieBezierCurveScaleExponent");
      self->_bezierCurveScaleExponent = v21;
    }
    else
    {
      objc_msgSend(v5, "switcherShelfNonGenieRopeSettings");
      v12 = (SBFFluidBehaviorSettings *)objc_claimAutoreleasedReturnValue();
      v13 = self->_ropeSettings;
      self->_ropeSettings = v12;

      objc_msgSend(v6, "switcherShelfCardNonGenieDismissedScale");
      self->_dismissalScale = v14;
      objc_msgSend(v6, "switcherShelfCardNonGenieResponseIncrementScalar");
      self->_perIndexResponseIncrement = v15;
      if (self->_expand)
        objc_msgSend(v6, "switcherShelfCardNonGeniePresentationSettings");
      else
        objc_msgSend(v6, "switcherShelfCardNonGenieDismissalSettings");
      v16 = (SBFFluidBehaviorSettings *)objc_claimAutoreleasedReturnValue();
      v22 = self->_settings;
      self->_settings = v16;

    }
  }
}

- (BOOL)shouldInterruptForRemovalEvent:(id)a3
{
  return self->_expand;
}

- (id)animatablePropertyIdentifiers
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", CFSTR("SBShelfRopeAnimatableProperty"), CFSTR("SBShelfBackgroundBlurAnimatableProperty"), 0);
  -[SBShelfExpansionSwitcherModifier _visibleOrderedAppLayouts](self, "_visibleOrderedAppLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    v6 = -1;
    do
    {
      v7 = objc_msgSend(v4, "count");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld%@"), v7 + v6, CFSTR("-SBShelfExpansionSwitcherModifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

      ++v5;
      --v6;
    }
    while (v5 < objc_msgSend(v4, "count"));
  }

  return v3;
}

- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;

  v5 = a5;
  v7 = a3;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SBShelfRopeAnimatableProperty")))
  {
    v8 = 1.0;
    if (self->_expand)
      v9 = 1.0;
    else
      v9 = 0.0;
    if (self->_expand)
      v8 = 0.0;
    if (v5)
      v10 = v8;
    else
      v10 = v9;
    goto LABEL_37;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SBShelfBackgroundBlurAnimatableProperty")))
  {
    if (v5)
    {
      if (self->_expand)
        v10 = 0.0;
      else
        v10 = 1.0;
      goto LABEL_37;
    }
    if (self->_expand)
    {
      -[SBShelfExpansionSwitcherModifier appLayouts](self, "appLayouts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        v12 = objc_msgSend(v11, "count");
        v13 = -[SBShelfExpansionSwitcherModifier _isMovingFromLeadingToTrailing](self, "_isMovingFromLeadingToTrailing");
        v14 = -1;
        if (!v13)
          v14 = -v12;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld%@"), v14 + v12, CFSTR("-SBShelfExpansionSwitcherModifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBShelfExpansionSwitcherModifier presentationValueForAnimatableProperty:](self, "presentationValueForAnimatableProperty:", v15);
        -[SBShelfExpansionSwitcherModifier modelValueForAnimatableProperty:currentValue:creating:](self, "modelValueForAnimatableProperty:currentValue:creating:", v15, 0);
        v10 = v16;

      }
      else
      {
        v10 = 1.0;
      }

      goto LABEL_37;
    }
LABEL_31:
    v10 = 0.0;
    goto LABEL_37;
  }
  if (v5)
  {
    if (-[SBShelfExpansionSwitcherModifier _isEffectivelyInShelf](self, "_isEffectivelyInShelf"))
      v10 = 1.0;
    else
      v10 = 0.0;
    goto LABEL_37;
  }
  if (!self->_expand)
    goto LABEL_31;
  v17 = _SBShelfExpansionIndexFromAnimatableIdentifier(v7);
  v10 = 1.0;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = v17;
    -[SBShelfExpansionSwitcherModifier _visibleOrderedAppLayouts](self, "_visibleOrderedAppLayouts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    -[SBShelfExpansionSwitcherModifier presentationValueForAnimatableProperty:](self, "presentationValueForAnimatableProperty:", CFSTR("SBShelfRopeAnimatableProperty"));
    v22 = v21;
    v23 = 1.0 / (double)(unint64_t)(v20 + 1);
    v24 = -[SBShelfExpansionSwitcherModifier _isMovingFromLeadingToTrailing](self, "_isMovingFromLeadingToTrailing");
    if (!self->_style || v24)
    {
      if (v18 <= vcvtmd_u64_f64(v22 / v23))
        v10 = 1.0;
      else
        v10 = 0.0;
    }
    else if (v18 >= (unint64_t)((double)(unint64_t)(v20 - 1) - floor(v22 / v23)))
    {
      v10 = 1.0;
    }
    else
    {
      v10 = 0.0;
    }
  }
LABEL_37:

  return v10;
}

- (int64_t)updateModeForAnimatableProperty:(id)a3
{
  return 3;
}

- (id)settingsForAnimatableProperty:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  void *v11;
  id v12;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  double v18;
  double v19;
  unint64_t v20;
  BOOL v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CAFrameRateRange v28;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBShelfRopeAnimatableProperty")))
  {
    v5 = 192;
LABEL_11:
    v12 = *(id *)((char *)&self->super.super.super.super.isa + v5);
LABEL_12:
    v11 = v12;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBShelfBackgroundBlurAnimatableProperty")))
  {
    if (self->_expand)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
      objc_msgSend(v6, "setDampingRatio:", 1.0);
      -[SBShelfExpansionSwitcherModifier appLayouts](self, "appLayouts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8 >= 5)
        v9 = 5;
      else
        v9 = v8;
      -[SBFFluidBehaviorSettings response](self->_settings, "response");
      objc_msgSend(v6, "setResponse:", v10 + (double)v9 * self->_perIndexResponseIncrement);

      v11 = 0;
      goto LABEL_13;
    }
LABEL_10:
    v5 = 184;
    goto LABEL_11;
  }
  if (self->_expand)
    goto LABEL_10;
  v14 = _SBShelfExpansionIndexFromAnimatableIdentifier(v4);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v27.receiver = self;
    v27.super_class = (Class)SBShelfExpansionSwitcherModifier;
    -[SBShelfExpansionSwitcherModifier settingsForAnimatableProperty:](&v27, sel_settingsForAnimatableProperty_, v4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v15 = v14;
  -[SBShelfExpansionSwitcherModifier _visibleOrderedAppLayouts](self, "_visibleOrderedAppLayouts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  v18 = (double)v15;
  v19 = (double)v17 + -1.0;
  v20 = 5 - (unint64_t)((double)v15 / v19 * 5.0);
  v21 = -[SBShelfExpansionSwitcherModifier _isMovingFromLeadingToTrailing](self, "_isMovingFromLeadingToTrailing");
  v22 = (unint64_t)((double)(unint64_t)v18 / v19 * 5.0);
  if (v21)
    v22 = v20;
  if (self->_style == 1)
    v20 = v22;
  -[SBFFluidBehaviorSettings dampingRatio](self->_settings, "dampingRatio");
  v24 = v23;
  -[SBFFluidBehaviorSettings response](self->_settings, "response");
  v26 = v25 + (double)v20 * self->_perIndexResponseIncrement;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v11, "setResponse:", v26);
  objc_msgSend(v11, "setDampingRatio:", v24);
  v28 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v28.minimum, *(double *)&v28.maximum, *(double *)&v28.preferred);
LABEL_13:

  return v11;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  long double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect result;

  v15.receiver = self;
  v15.super_class = (Class)SBShelfExpansionSwitcherModifier;
  -[SBShelfExpansionSwitcherModifier frameForIndex:](&v15, sel_frameForIndex_);
  UIRectGetCenter();
  v6 = v5;
  v8 = v7;
  -[SBShelfExpansionSwitcherModifier _presentationValueForIndex:](self, "_presentationValueForIndex:", a3);
  if (self->_style == 1)
  {
    v10 = 1.0 - v9;
    -[SBShelfExpansionSwitcherModifier _bezierPointFromTime:start:target:](self, "_bezierPointFromTime:start:target:", (double)pow(1.0 - v9, self->_bezierCurveXExponent), v6, v8, self->_target.x, self->_target.y);
    -[SBShelfExpansionSwitcherModifier _bezierPointFromTime:start:target:](self, "_bezierPointFromTime:start:target:", (double)pow(v10, self->_bezierCurveYExponent), v6, v8, self->_target.x, self->_target.y);
  }
  else
  {
    -[SBShelfExpansionSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
    -[SBShelfExpansionSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  }
  UIRectCenteredAboutPoint();
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)shouldUpdateAnimatableProperty:(id)a3
{
  return -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase", a3) != 1;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double dismissalScale;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  -[SBShelfExpansionSwitcherModifier _presentationValueForIndex:](self, "_presentationValueForIndex:");
  if (self->_style == 1)
  {
    v6 = fmax(v5, 0.0);
    if (v6 >= 1.0)
      v8 = 0.0;
    else
      v8 = 1.0 - v6;
    dismissalScale = self->_dismissalScale;
    v9 = dismissalScale + (1.0 - dismissalScale) * (1.0 - pow(v8, self->_bezierCurveScaleExponent));
  }
  else
  {
    v9 = self->_dismissalScale + v5 * (1.0 - self->_dismissalScale);
  }
  v12.receiver = self;
  v12.super_class = (Class)SBShelfExpansionSwitcherModifier;
  -[SBShelfExpansionSwitcherModifier scaleForIndex:](&v12, sel_scaleForIndex_, a3);
  return v9 * v10;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double result;

  if (self->_style == 1)
    return 1.0;
  -[SBShelfExpansionSwitcherModifier _presentationValueForIndex:](self, "_presentationValueForIndex:", a5, a4);
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v7;
  double v8;
  double v9;
  objc_super v11;

  -[SBShelfExpansionSwitcherModifier _presentationValueForIndex:](self, "_presentationValueForIndex:", a4);
  v8 = v7;
  v11.receiver = self;
  v11.super_class = (Class)SBShelfExpansionSwitcherModifier;
  -[SBShelfExpansionSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v11, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4);
  return v8 * v9 + 0.0;
}

- (double)shelfBackgroundBlurOpacity
{
  double result;

  -[SBShelfExpansionSwitcherModifier presentationValueForAnimatableProperty:](self, "presentationValueForAnimatableProperty:", CFSTR("SBShelfBackgroundBlurAnimatableProperty"));
  return result;
}

- (unint64_t)transactionCompletionOptions
{
  return 6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBShelfExpansionSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v6, sel_animationAttributesForLayoutElement_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setUpdateMode:", 1);
  return v4;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  return self->_expand;
}

- (id)topMostLayoutElements
{
  unint64_t v3;
  int64_t v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSArray *v24;
  NSArray *topMostLayoutElements_lastElements;
  CGFloat v27;
  CGFloat v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v3 = -[SBShelfExpansionSwitcherModifier appLayoutsGenerationCount](self, "appLayoutsGenerationCount");
  v4 = -[SBShelfExpansionSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBShelfExpansionSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBShelfExpansionSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v27 = v14;
  v28 = v13;
  v16 = v15;
  v18 = v17;
  -[SBShelfExpansionSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v20 = v19;
  v22 = v21;
  if (*(_OWORD *)&self->_topMostLayoutElements_lastAppLayoutsGenCount != __PAIR128__(v4, v3))
    goto LABEL_10;
  v30.origin.x = v6;
  v30.origin.y = v8;
  v30.size.width = v10;
  v30.size.height = v12;
  if (!CGRectEqualToRect(self->_topMostLayoutElements_lastContainerViewBounds, v30))
    goto LABEL_10;
  v31.origin.y = v27;
  v31.origin.x = v28;
  v31.size.width = v16;
  v31.size.height = v18;
  if (!CGRectEqualToRect(self->_topMostLayoutElements_lastSwitcherViewBounds, v31))
    goto LABEL_10;
  if (self->_topMostLayoutElements_lastContentOffset.x != v20
    || self->_topMostLayoutElements_lastContentOffset.y != v22)
  {
LABEL_10:
    self->_topMostLayoutElements_lastAppLayoutsGenCount = v3;
    self->_topMostLayoutElements_lastOrientation = v4;
    self->_topMostLayoutElements_lastContainerViewBounds.origin.x = v6;
    self->_topMostLayoutElements_lastContainerViewBounds.origin.y = v8;
    self->_topMostLayoutElements_lastContainerViewBounds.size.width = v10;
    self->_topMostLayoutElements_lastContainerViewBounds.size.height = v12;
    self->_topMostLayoutElements_lastSwitcherViewBounds.origin.x = v28;
    self->_topMostLayoutElements_lastSwitcherViewBounds.origin.y = v27;
    self->_topMostLayoutElements_lastSwitcherViewBounds.size.width = v16;
    self->_topMostLayoutElements_lastSwitcherViewBounds.size.height = v18;
    self->_topMostLayoutElements_lastContentOffset.x = v20;
    self->_topMostLayoutElements_lastContentOffset.y = v22;
    v29.receiver = self;
    v29.super_class = (Class)SBShelfExpansionSwitcherModifier;
    -[SBShelfExpansionSwitcherModifier topMostLayoutElements](&v29, sel_topMostLayoutElements);
    v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
    topMostLayoutElements_lastElements = self->_topMostLayoutElements_lastElements;
    self->_topMostLayoutElements_lastElements = v24;

  }
  return self->_topMostLayoutElements_lastElements;
}

- (id)transitionWillBegin
{
  void *v2;
  SBPreemptAnimationSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBShelfExpansionSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBPreemptAnimationSwitcherEventResponse initWithOptions:]([SBPreemptAnimationSwitcherEventResponse alloc], "initWithOptions:", 3);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)handleAnimatablePropertyChangedEvent:(id)a3
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBShelfExpansionSwitcherModifier;
  -[SBSwitcherModifier handleAnimatablePropertyChangedEvent:](&v7, sel_handleAnimatablePropertyChangedEvent_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 1);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_visibleOrderedAppLayouts
{
  id v3;
  double v4;
  double v5;
  BOOL v6;
  NSArray *v7;
  id WeakRetained;
  NSArray *v9;
  NSArray *cached_visibleOrderedAppLayouts;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBShelfExpansionSwitcherModifier;
  v3 = -[SBShelfExpansionSwitcherModifier appLayoutsGenerationCount](&v13, sel_appLayoutsGenerationCount);
  v12.receiver = self;
  v12.super_class = (Class)SBShelfExpansionSwitcherModifier;
  -[SBShelfExpansionSwitcherModifier scrollViewContentOffset](&v12, sel_scrollViewContentOffset);
  if ((id)self->_cached_appLayoutsGenCount != v3
    || (self->_cached_scrollViewContentOffset.x == v4 ? (v6 = self->_cached_scrollViewContentOffset.y == v5) : (v6 = 0),
        !v6 || (v7 = self->_cached_visibleOrderedAppLayouts) == 0))
  {
    self->_cached_appLayoutsGenCount = (unint64_t)v3;
    self->_cached_scrollViewContentOffset.x = v4;
    self->_cached_scrollViewContentOffset.y = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
    objc_msgSend(WeakRetained, "orderedVisibleAppLayoutsForShelfExpansionModifier:", self);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cached_visibleOrderedAppLayouts = self->_cached_visibleOrderedAppLayouts;
    self->_cached_visibleOrderedAppLayouts = v9;

    v7 = self->_cached_visibleOrderedAppLayouts;
  }
  return v7;
}

- (BOOL)_isMovingFromLeadingToTrailing
{
  double x;
  double v4;

  x = self->_target.x;
  -[SBShelfExpansionSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  return -[SBShelfExpansionSwitcherModifier isRTLEnabled](self, "isRTLEnabled") ^ (x >= v4 * 0.5);
}

- (BOOL)_isEffectivelyInShelf
{
  return (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1) ^ self->_expand;
}

- (CGPoint)_bezierPointFromTime:(double)a3 start:(CGPoint)a4 target:(CGPoint)a5
{
  double y;
  double x;
  long double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  long double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = fmin(fmax(a3, 0.0), 1.0);
  v8 = a5.x - a4.x;
  v9 = v8 * 3.0;
  v10 = -(v8 * 3.0 - (a5.x - a5.x) * 3.0);
  v17 = v8 - v8 * 3.0 - v10;
  v11 = (y - y) * 3.0;
  v12 = -(v11 - (a5.y + self->_bezierCurvePointYDeltaFromTarget - a4.y) * 3.0);
  v13 = a5.y - a4.y - v11 - v12;
  v14 = pow(v7, 3.0);
  v15 = y + v7 * v7 * v12 + v13 * v14 + v11 * v7;
  v16 = x + v10 * (v7 * v7) + v17 * v14 + v9 * v7;
  result.y = v15;
  result.x = v16;
  return result;
}

- (double)_presentationValueForIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;

  -[SBShelfExpansionSwitcherModifier _visibleOrderedAppLayouts](self, "_visibleOrderedAppLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v5, "count") <= a3)
      a3 = objc_msgSend(v5, "count") - 1;
    v6 = objc_msgSend(v5, "count");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld%@"), v6 + ~a3, CFSTR("-SBShelfExpansionSwitcherModifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBShelfExpansionSwitcherModifier presentationValueForAnimatableProperty:](self, "presentationValueForAnimatableProperty:", v7);
    v9 = v8;

  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (SBShelfExpansionSwitcherModifierDelegate)animationDelegate
{
  return (SBShelfExpansionSwitcherModifierDelegate *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_storeStrong((id *)&self->_topMostLayoutElements_lastElements, 0);
  objc_storeStrong((id *)&self->_cached_visibleOrderedAppLayouts, 0);
  objc_storeStrong((id *)&self->_ropeSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
