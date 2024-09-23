@implementation SBCrossblurDosidoSwitcherModifier

- (SBCrossblurDosidoSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 direction:(unint64_t)a6
{
  id v12;
  id v13;
  SBCrossblurDosidoSwitcherModifier *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  v14 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v18, sel_initWithTransitionID_, a3);
  if (v14)
  {
    if (v12)
    {
      if (v13)
      {
LABEL_4:
        objc_storeStrong((id *)&v14->_fromAppLayout, a4);
        objc_storeStrong((id *)&v14->_toAppLayout, a5);
        v14->_direction = a6;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBCrossblurDosidoSwitcherModifier.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

      if (v13)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBCrossblurDosidoSwitcherModifier.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

    goto LABEL_4;
  }
LABEL_5:

  return v14;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  float v12;

  -[SBCrossblurDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disableAsyncRenderingTransitionPercentage");
  v8 = v7;

  -[SBCrossblurDosidoSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "settlingDuration");
  v11 = v8 * v10;
  UIAnimationDragCoefficient();
  *a3 = v11 * v12;

  return 1;
}

- (id)transitionWillBegin
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBBlurItemContainerParameters *v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  SBBlurItemContainerParameters *v16;
  SBBlurItemContainerSwitcherEventResponse *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v20, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBBlurItemContainerParameters defaultCrossblurBlurParameters](SBBlurItemContainerParameters, "defaultCrossblurBlurParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCrossblurDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [SBBlurItemContainerParameters alloc];
  objc_msgSend(v8, "homeScreenCenterZoomInitialBlur");
  v11 = v10;
  v12 = objc_msgSend(v6, "shouldRasterize");
  objc_msgSend(v6, "rasterizationScale");
  v14 = v13;
  objc_msgSend(v6, "blurAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBBlurItemContainerParameters initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:](v9, "initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:", v12, 1, 1, v15, v11, v14);

  v17 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:blurParameters:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:blurParameters:animationUpdateMode:", self->_toAppLayout, 1, v16, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v17, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)transitionWillUpdate
{
  void *v3;
  SBBlurItemContainerSwitcherEventResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SBBlurItemContainerParameters *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  SBBlurItemContainerParameters *v18;
  SBBlurItemContainerSwitcherEventResponse *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v22, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_fromAppLayout, 1, 3);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBBlurItemContainerParameters defaultCrossblurBlurParameters](SBBlurItemContainerParameters, "defaultCrossblurBlurParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCrossblurDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "homeScreenCenterZoomInitialBlur");
  v10 = v9;
  objc_msgSend(v8, "homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete");
  v12 = v10 * (v11 + -1.0) / v11;
  v13 = [SBBlurItemContainerParameters alloc];
  v14 = objc_msgSend(v6, "shouldRasterize");
  objc_msgSend(v6, "rasterizationScale");
  v16 = v15;
  objc_msgSend(v6, "blurAnimationSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SBBlurItemContainerParameters initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:](v13, "initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:", v14, 1, 1, v17, v12, v16);

  v19 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:blurParameters:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:blurParameters:animationUpdateMode:", self->_toAppLayout, 1, v18, 3);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v19, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)transitionDidEnd
{
  void *v3;
  SBBlurItemContainerSwitcherEventResponse *v4;
  void *v5;
  SBBlurItemContainerSwitcherEventResponse *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v9, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_fromAppLayout, 0, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_toAppLayout, 0, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)handleResizeProgressEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBBlurItemContainerSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleResizeProgressEvent:](&v11, sel_handleResizeProgressEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress", v11.receiver, v11.super_class);

  -[SBCrossblurDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete");
  if (BSFloatGreaterThanOrEqualToFloat())
  {
    v8 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_toAppLayout, 0, 2);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }

  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  SBAppLayout *fromAppLayout;
  double v8;
  double v9;
  double v10;
  double v11;
  SBCrossblurDosidoSwitcherModifier **v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  SBAppLayout *toAppLayout;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  SBCrossblurDosidoSwitcherModifier *v28;
  __objc2_class *v29;
  SBCrossblurDosidoSwitcherModifier *v30;
  __objc2_class *v31;
  objc_super v32;
  objc_super v33;
  SBCrossblurDosidoSwitcherModifier *v34;
  __objc2_class *v35;
  CGRect result;

  -[SBCrossblurDosidoSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  fromAppLayout = self->_fromAppLayout;
  if (v6 == fromAppLayout || v6 == self->_toAppLayout)
  {
    if (-[SBAppLayout environment](v6, "environment") == 2)
    {
      -[SBCrossblurDosidoSwitcherModifier containerViewBounds](self, "containerViewBounds");
      goto LABEL_28;
    }
    fromAppLayout = self->_fromAppLayout;
  }
  if (v6 == fromAppLayout)
  {
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
    {
      v34 = self;
      v35 = SBCrossblurDosidoSwitcherModifier;
      v12 = &v34;
LABEL_27:
      objc_msgSendSuper2((objc_super *)v12, sel_frameForIndex_, a3, v28, v29, v30, v31, v32.receiver, v32.super_class, v33.receiver, v33.super_class, v34, v35);
      goto LABEL_28;
    }
    fromAppLayout = self->_fromAppLayout;
  }
  if (v6 == fromAppLayout && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2)
  {
    -[SBCrossblurDosidoSwitcherModifier appLayouts](self, "appLayouts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexOfObject:", self->_toAppLayout);

    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      v15 = a3;
    else
      v15 = v14;
    -[SBCrossblurDosidoSwitcherModifier frameForIndex:](&v33, sel_frameForIndex_, v15, v28, v29, v30, v31, v32.receiver, v32.super_class, self, SBCrossblurDosidoSwitcherModifier, v34, v35);
    goto LABEL_28;
  }
  toAppLayout = self->_toAppLayout;
  if (v6 != toAppLayout)
  {
LABEL_23:
    if (v6 == toAppLayout && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2)
    {
      v30 = self;
      v31 = SBCrossblurDosidoSwitcherModifier;
      v12 = &v30;
    }
    else
    {
      v28 = self;
      v29 = SBCrossblurDosidoSwitcherModifier;
      v12 = &v28;
    }
    goto LABEL_27;
  }
  if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") != 1)
  {
    toAppLayout = self->_toAppLayout;
    goto LABEL_23;
  }
  -[SBCrossblurDosidoSwitcherModifier appLayouts](self, "appLayouts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "indexOfObject:", self->_fromAppLayout);

  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    v19 = a3;
  else
    v19 = v18;
  -[SBCrossblurDosidoSwitcherModifier frameForIndex:](&v32, sel_frameForIndex_, v19, v28, v29, v30, v31, self, SBCrossblurDosidoSwitcherModifier, v33.receiver, v33.super_class, v34, v35);
LABEL_28:
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v23 = v11;

  v24 = v20;
  v25 = v21;
  v26 = v22;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBCrossblurDosidoSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  v7 = 1.0;
  if (v6 != self->_fromAppLayout && v6 != self->_toAppLayout)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
    -[SBCrossblurDosidoSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_, a3);
    v7 = v8;
  }

  return v7;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  objc_super v13;

  v6 = (SBAppLayout *)a4;
  v7 = -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase");
  -[SBCrossblurDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_fromAppLayout == v6)
  {
    v11 = 1.0;
    if (v7 >= 2)
    {
      if (self->_direction == 1)
      {
        objc_msgSend(v9, "crossblurDosidoSmallScale");
        goto LABEL_11;
      }
LABEL_9:
      objc_msgSend(v9, "crossblurDosidoLargeScale");
      goto LABEL_11;
    }
  }
  else
  {
    if (self->_toAppLayout != v6)
    {
      v13.receiver = self;
      v13.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
      -[SBCrossblurDosidoSwitcherModifier scaleForLayoutRole:inAppLayout:](&v13, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
LABEL_11:
      v11 = v10;
      goto LABEL_12;
    }
    v11 = 1.0;
    if (v7 <= 1)
    {
      if (self->_direction != 1)
      {
        objc_msgSend(v9, "crossblurDosidoCenterZoomUpSmallScale");
        goto LABEL_11;
      }
      goto LABEL_9;
    }
  }
LABEL_12:

  return v11;
}

- (id)visibleAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", self->_fromAppLayout, self->_toAppLayout, 0);
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBCrossblurDosidoSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  -[SBCrossblurDosidoSwitcherModifier _opacitySettings](self, "_opacitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpacitySettings:", v7);

  return v5;
}

- (id)_layoutSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBCrossblurDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "crossblurDosidoSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_opacitySettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBCrossblurDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "crossblurDosidoSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v15;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  if (self->_toAppLayout == a4)
  {
    v16.receiver = self;
    v16.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
    -[SBCrossblurDosidoSwitcherModifier resizeProgressNotificationsForLayoutRole:inAppLayout:](&v16, sel_resizeProgressNotificationsForLayoutRole_inAppLayout_, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCrossblurDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete");
    v10 = v9;
    objc_msgSend(v8, "homeScreenCenterZoomInitialScale");
    v17[0] = &unk_1E91CF728;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v10 - v11) / (1.0 - v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    v17[2] = &unk_1E91CF738;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObjectsFromArray:", v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
    -[SBCrossblurDosidoSwitcherModifier resizeProgressNotificationsForLayoutRole:inAppLayout:](&v15, sel_resizeProgressNotificationsForLayoutRole_inAppLayout_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  objc_super v18;

  v8 = a4;
  -[SBCrossblurDosidoSwitcherModifier appLayouts](self, "appLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", self->_fromAppLayout);
  v11 = objc_msgSend(v9, "indexOfObject:", self->_toAppLayout);
  if (v10 == a5)
  {
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2)
      v12 = 0.0;
    else
      v12 = 1.0;
  }
  else if (v11 == a5)
  {
    v12 = 1.0;
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") <= 1)
    {
      -[SBCrossblurDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "animationSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "homeScreenCenterZoomInitialOpacity");
      v12 = v15;

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
    -[SBCrossblurDosidoSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v18, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v12 = v16;
  }

  return v12;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  objc_super v4;

  if (!-[SBCrossblurDosidoSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))return 1;
  v4.receiver = self;
  v4.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  return -[SBCrossblurDosidoSwitcherModifier isWallpaperRequiredForSwitcher](&v4, sel_isWallpaperRequiredForSwitcher);
}

- (int64_t)wallpaperStyle
{
  objc_super v4;

  if (!-[SBCrossblurDosidoSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))return 2;
  v4.receiver = self;
  v4.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  return -[SBCrossblurDosidoSwitcherModifier wallpaperStyle](&v4, sel_wallpaperStyle);
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v5 = 0.0;
  if ((objc_msgSend(v4, "isEqual:", self->_fromAppLayout) & 1) == 0
    && (objc_msgSend(v4, "isEqual:", self->_toAppLayout) & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
    -[SBCrossblurDosidoSwitcherModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
    v5 = v6;
  }

  return v5;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  -[SBCrossblurDosidoSwitcherModifier topMostLayoutElements](&v6, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_toAppLayout, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
