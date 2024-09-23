@implementation SBCenterWindowPagePresentationSwitcherModifier

- (SBCenterWindowPagePresentationSwitcherModifier)initWithTransitionID:(id)a3 toAppLayout:(id)a4 isMorph:(BOOL)a5
{
  id v9;
  SBCenterWindowPagePresentationSwitcherModifier *v10;
  SBCenterWindowPagePresentationSwitcherModifier *v11;
  uint64_t v12;
  SBFFluidBehaviorSettings *defaultCriticallyDampedSettings;
  SBFFluidBehaviorSettings *v14;
  objc_super v16;
  CAFrameRateRange v17;

  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
  v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v16, sel_initWithTransitionID_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_toAppLayout, a4);
    v11->_isInAppMorphAnimation = a5;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    defaultCriticallyDampedSettings = v11->_defaultCriticallyDampedSettings;
    v11->_defaultCriticallyDampedSettings = (SBFFluidBehaviorSettings *)v12;

    -[SBFFluidBehaviorSettings setDefaultCriticallyDampedValues](v11->_defaultCriticallyDampedSettings, "setDefaultCriticallyDampedValues");
    v14 = v11->_defaultCriticallyDampedSettings;
    v17 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v14, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v17.minimum, *(double *)&v17.maximum, *(double *)&v17.preferred);
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
  v6.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)transitionDidEnd
{
  void *v3;
  SBCancelWindowMorphingSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
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

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  return !self->_isInAppMorphAnimation;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  unsigned __int16 v5;
  SBSwitcherAsyncRenderingAttributes v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_toAppLayout) && self->_isInAppMorphAnimation)
  {
    v5 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
    v5 = (unsigned __int16)-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v8, sel_asyncRenderingAttributesForAppLayout_, v4);
  }
  v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
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
  objc_super v19;
  CGRect result;

  -[SBCenterWindowPagePresentationSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqual:", self->_toAppLayout)
    && -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    -[SBCenterWindowPagePresentationSwitcherModifier containerViewBounds](self, "containerViewBounds");
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
    -[SBCenterWindowPagePresentationSwitcherModifier frameForIndex:](&v19, sel_frameForIndex_, a3);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBCenterWindowPagePresentationSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "isEqual:", self->_toAppLayout)
    || (v7 = 1.0, !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
    -[SBCenterWindowPagePresentationSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_, a3);
    v7 = v8;
  }

  return v7;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  int v20;
  BOOL v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGRect v32;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
  v11 = a4;
  -[SBCenterWindowPagePresentationSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v31, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = objc_msgSend(v11, "isEqual:", self->_toAppLayout, v31.receiver, v31.super_class);

  if (v20)
    v21 = a3 == 4;
  else
    v21 = 0;
  if (v21
    && -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")
    && !self->_isInAppMorphAnimation)
  {
    v32.origin.x = v13;
    v32.origin.y = v15;
    v32.size.width = v17;
    v32.size.height = v19;
    v22 = CGRectGetHeight(v32);
    -[SBCenterWindowPagePresentationSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dosidoDeclineIntentAnimationSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fromViewSlideOutHeightOffsetMultiplier");
    v26 = v22 * v25;

    v15 = v15 + v26;
  }
  v27 = v13;
  v28 = v15;
  v29 = v17;
  v30 = v19;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  BOOL v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
  v8 = a4;
  -[SBCenterWindowPagePresentationSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v13, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
  v10 = v9;
  LODWORD(a5) = objc_msgSend(v8, "isEqual:", self->_toAppLayout, v13.receiver, v13.super_class);

  if ((_DWORD)a5)
    v11 = a3 == 4;
  else
    v11 = 0;
  if (v11 && self->_isInAppMorphAnimation)
    return 0.0;
  return v10;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqual:", self->_toAppLayout)
    || (v5 = 0.0, !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
    -[SBCenterWindowPagePresentationSwitcherModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
    v5 = v6;
  }

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCenterWindowPagePresentationSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!self->_isInAppMorphAnimation)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "setLayoutSettings:", self->_defaultCriticallyDampedSettings);
    objc_msgSend(v6, "setPositionSettings:", self->_defaultCriticallyDampedSettings);
    objc_msgSend(v6, "setScaleSettings:", self->_defaultCriticallyDampedSettings);

    v5 = v6;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultCriticallyDampedSettings, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end
