@implementation SBSceneResizeGestureRootSwitcherModifier

- (SBSceneResizeGestureRootSwitcherModifier)initWithAppLayout:(id)a3 spaceConfiguration:(int64_t)a4
{
  id v7;
  SBSceneResizeGestureRootSwitcherModifier *v8;
  SBSceneResizeGestureRootSwitcherModifier *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSceneResizeGestureRootSwitcherModifier;
  v8 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v11, sel_initWithStartingEnvironmentMode_, 3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appLayout, a3);
    v9->_startingSpaceConfiguration = a4;
  }

  return v9;
}

- (int64_t)gestureType
{
  return 7;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5;
  SBSceneResizeGestureSwitcherModifier *v6;
  void *v7;
  SBSceneResizeGestureSwitcherModifier *v8;

  v5 = a3;
  v6 = [SBSceneResizeGestureSwitcherModifier alloc];
  objc_msgSend(v5, "gestureID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBSceneResizeGestureSwitcherModifier initWithGestureID:appLayout:spaceConfiguration:](v6, "initWithGestureID:appLayout:spaceConfiguration:", v7, self->_appLayout, self->_startingSpaceConfiguration);
  return v8;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  SBSceneResizeTransitionSwitcherModifier *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  SBSceneResizeTransitionSwitcherModifier *v17;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_class();
  v8 = v5;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  v11 = [SBSceneResizeTransitionSwitcherModifier alloc];
  objc_msgSend(v6, "transitionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromAppLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toAppLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_minimumCardWidthForDismissalAction");
  v16 = v15;

  v17 = -[SBSceneResizeTransitionSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:minimumCardWithForDismissal:](v11, "initWithTransitionID:fromAppLayout:toAppLayout:minimumCardWithForDismissal:", v12, v13, v14, v16);
  return v17;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *v6;
  SBAppLayout *appLayout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSceneResizeGestureRootSwitcherModifier;
  v4 = a3;
  -[SBGestureRootSwitcherModifier handleTransitionEvent:](&v9, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toAppLayout", v9.receiver, v9.super_class);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  appLayout = self->_appLayout;
  self->_appLayout = v6;

  return v5;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
