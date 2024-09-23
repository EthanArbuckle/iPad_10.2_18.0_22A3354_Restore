@implementation SBHomeGestureRootFloatingSwitcherModifier

- (SBHomeGestureRootFloatingSwitcherModifier)initWithMultitaskingModifier:(id)a3 floatingConfiguration:(int64_t)a4
{
  id v7;
  SBHomeGestureRootFloatingSwitcherModifier *v8;
  SBHomeGestureRootFloatingSwitcherModifier *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHomeGestureRootFloatingSwitcherModifier;
  v8 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v11, sel_initWithStartingEnvironmentMode_, 3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_multitaskingModifier, a3);
    v9->_floatingConfiguration = a4;
  }

  return v9;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureRootFloatingSwitcherModifier;
  -[SBGestureRootSwitcherModifier descriptionBuilderWithMultilinePrefix:](&v8, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringForFloatingConfiguration(self->_floatingConfiguration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("floatingConfiguration"));

  return v4;
}

- (int64_t)gestureType
{
  return 3;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  SBHomeGestureFloatingSwitcherModifier *v10;
  void *v11;
  SBHomeGestureFloatingSwitcherModifier *v12;

  v6 = a4;
  v7 = a3;
  -[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  v10 = [SBHomeGestureFloatingSwitcherModifier alloc];
  objc_msgSend(v7, "gestureID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SBHomeGestureFloatingSwitcherModifier initWithGestureID:selectedAppLayout:continuingGesture:lastGestureWasAnArcSwipe:floatingConfiguration:](v10, "initWithGestureID:selectedAppLayout:continuingGesture:lastGestureWasAnArcSwipe:floatingConfiguration:", v11, v8, v6 != 0, isKindOfClass & 1, self->_floatingConfiguration);
  return v12;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  SBHomeGestureToSwitcherFloatingSwitcherModifier *v12;
  SBSwitcherModifier *multitaskingModifier;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  SBArcSwipeFloatingSwitcherModifier *v33;
  SBHomeGestureToStashedFloatingSwitcherModifier *v34;
  void *v36;
  _BOOL8 v37;
  CGRect v38;
  CGRect v39;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "toFloatingAppLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "toFloatingSwitcherVisible");
  objc_msgSend(v7, "transitionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12 = [SBHomeGestureToSwitcherFloatingSwitcherModifier alloc];
    multitaskingModifier = self->_multitaskingModifier;
    -[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBHomeGestureToSwitcherFloatingSwitcherModifier initWithTransitionID:multitaskingModifier:selectedAppLayout:](v12, "initWithTransitionID:multitaskingModifier:selectedAppLayout:", v11, multitaskingModifier, v14);
LABEL_11:
    v33 = (SBArcSwipeFloatingSwitcherModifier *)v15;
    goto LABEL_12;
  }
  if (!v9)
  {
    v34 = [SBHomeGestureToStashedFloatingSwitcherModifier alloc];
    -[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBHomeGestureToStashedFloatingSwitcherModifier initWithTransitionID:fromAppLayout:toFloatingConfiguration:](v34, "initWithTransitionID:fromAppLayout:toFloatingConfiguration:", v11, v14, objc_msgSend(v7, "toFloatingConfiguration"));
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureRootFloatingSwitcherModifier.m"), 78, CFSTR("The gesture modifier should be an instance of SBHomeGestureFloatingSwitcherModifier."));

  }
  v37 = objc_msgSend(v8, "currentFinalDestination") == 1;
  -[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeGestureRootFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "indexOfObject:", v14);
  v18 = objc_msgSend(v16, "indexOfObject:", v9);
  v19 = 1;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = v18;
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SBHomeGestureRootFloatingSwitcherModifier _frameWithScaleAppliedForIndex:](self, "_frameWithScaleAppliedForIndex:", v17);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      -[SBHomeGestureRootFloatingSwitcherModifier _frameWithScaleAppliedForIndex:](self, "_frameWithScaleAppliedForIndex:", v20);
      v39.origin.x = v29;
      v39.origin.y = v30;
      v39.size.width = v31;
      v39.size.height = v32;
      v38.origin.x = v22;
      v38.origin.y = v24;
      v38.size.width = v26;
      v38.size.height = v28;
      v19 = CGRectIntersectsRect(v38, v39);
    }
  }
  v33 = -[SBArcSwipeFloatingSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:floatingConfiguration:direction:needsOvershoot:]([SBArcSwipeFloatingSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:floatingConfiguration:direction:needsOvershoot:", v11, v14, v9, objc_msgSend(v7, "toFloatingConfiguration"), v37, v19);

LABEL_12:
  return v33;
}

- (CGRect)_frameWithScaleAppliedForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[SBHomeGestureRootFloatingSwitcherModifier frameForIndex:](self, "frameForIndex:");
  -[SBHomeGestureRootFloatingSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBTransformedRectWithScale();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
}

@end
