@implementation SBSwitcherTransitionRequest

- (SBSwitcherTransitionRequest)init
{
  SBSwitcherTransitionRequest *v2;
  SBSwitcherTransitionRequest *v3;
  SBAppLayout *appLayout;
  NSString *bundleIdentifierForAppExpose;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherTransitionRequest;
  v2 = -[SBSwitcherTransitionRequest init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    appLayout = v2->_appLayout;
    v2->_appLayout = 0;

    v3->_unlockedEnvironmentMode = 0;
    v3->_preferredInterfaceOrientation = 0;
    v3->_floatingConfiguration = 0;
    *(int64x2_t *)&v3->_floatingSwitcherVisible = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v3->_autoPIPDisabled = 0x7FFFFFFFFFFFFFFFLL;
    v3->_source = 0;
    bundleIdentifierForAppExpose = v3->_bundleIdentifierForAppExpose;
    v3->_peekConfiguration = 0;
    v3->_bundleIdentifierForAppExpose = 0;

    v3->_entityInsertionPolicy = 0;
  }
  return v3;
}

+ (id)requestForActivatingAppLayout:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setAppLayout:", v4);

  return v5;
}

+ (id)requestForActivatingHomeScreen
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAppLayout:", v3);

  return v2;
}

+ (id)requestForActivatingAppSwitcher
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setUnlockedEnvironmentMode:", 2);
  return v2;
}

+ (id)requestForActivatingFloatingSwitcher
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setFloatingSwitcherVisible:", 1);
  return v2;
}

+ (id)requestForDeactivatingFloatingSwitcher
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setFloatingSwitcherVisible:", 0);
  return v2;
}

+ (id)requestForStashingFloatingApplicationWithFloatingConfiguration:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setFloatingConfiguration:", a3);
  return v4;
}

+ (id)requestForTapAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "layoutRole");
  v7 = objc_alloc_init((Class)a1);
  objc_msgSend(v7, "setAppLayout:", v5);
  objc_msgSend(v5, "itemForLayoutRole:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivatingDisplayItem:", v8);

  v9 = objc_msgSend(v4, "source");
  if (v9 == 1)
    objc_msgSend(v7, "setSource:", 51);

  return v7;
}

+ (id)requestForTapAppLayoutHeaderEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "layoutRole");

  v7 = objc_alloc_init((Class)a1);
  objc_msgSend(v7, "setAppLayout:", v5);
  objc_msgSend(v5, "itemForLayoutRole:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivatingDisplayItem:", v8);

  return v7;
}

- (NSString)description
{
  return (NSString *)-[SBSwitcherTransitionRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSwitcherTransitionRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  unint64_t unlockedEnvironmentMode;
  void *v6;
  int64_t preferredInterfaceOrientation;
  const __CFString *v8;
  unint64_t floatingConfiguration;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SBAppLayout *appLayout;
  void *v15;
  id v16;
  SBDisplayItem *activatingDisplayItem;
  void *v18;
  id v19;
  unint64_t appLayoutEnvironment;
  void *v21;
  unint64_t source;
  void *v23;
  void *v24;
  NSString *bundleIdentifierForAppExpose;
  id v26;
  id v27;
  id v28;
  SBFFluidBehaviorSettings *animationSettings;
  id v30;
  id v31;

  -[SBSwitcherTransitionRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  unlockedEnvironmentMode = self->_unlockedEnvironmentMode;
  if (unlockedEnvironmentMode)
  {
    SBStringForUnlockedEnvironmentMode(unlockedEnvironmentMode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v6, CFSTR("environmentMode"));

  }
  preferredInterfaceOrientation = self->_preferredInterfaceOrientation;
  v8 = CFSTR("UIInterfaceOrientationPortrait");
  switch(preferredInterfaceOrientation)
  {
    case 0:
      goto LABEL_10;
    case 1:
      goto LABEL_9;
    case 3:
      v8 = CFSTR("UIInterfaceOrientationLandscapeRight");
      goto LABEL_9;
    case 4:
      v8 = CFSTR("UIInterfaceOrientationLandscapeLeft");
      goto LABEL_9;
    default:
      if (preferredInterfaceOrientation == 2)
        v8 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
      else
        v8 = 0;
LABEL_9:
      objc_msgSend(v4, "appendString:withName:", v8, CFSTR("preferredOrientation"));
LABEL_10:
      floatingConfiguration = self->_floatingConfiguration;
      if (floatingConfiguration)
      {
        SBStringForFloatingConfiguration(floatingConfiguration);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:withName:", v10, CFSTR("floatingConfiguration"));

      }
      if (self->_floatingSwitcherVisible != 0x7FFFFFFFFFFFFFFFLL)
      {
        BSSettingFlagDescription();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:withName:", v11, CFSTR("floatingSwitcherVisible"));

      }
      if (self->_animationDisabled != 0x7FFFFFFFFFFFFFFFLL)
      {
        BSSettingFlagDescription();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:withName:", v12, CFSTR("animationDisabled"));

      }
      if (self->_autoPIPDisabled != 0x7FFFFFFFFFFFFFFFLL)
      {
        BSSettingFlagDescription();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:withName:", v13, CFSTR("autoPIPDisabled"));

      }
      appLayout = self->_appLayout;
      if (appLayout)
      {
        -[SBAppLayout succinctDescription](appLayout, "succinctDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (id)objc_msgSend(v4, "appendObject:withName:", v15, CFSTR("appLayout"));

      }
      activatingDisplayItem = self->_activatingDisplayItem;
      if (activatingDisplayItem)
      {
        -[SBDisplayItem succinctDescription](activatingDisplayItem, "succinctDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v4, "appendObject:withName:", v18, CFSTR("activatingDisplayItem"));

      }
      appLayoutEnvironment = self->_appLayoutEnvironment;
      if (appLayoutEnvironment)
      {
        SBStringForAppLayoutEnvironment(appLayoutEnvironment);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:withName:", v21, CFSTR("appLayoutEnvironment"));

      }
      source = self->_source;
      if (source)
      {
        SBMainWorkspaceTransitionSourceDescription(source);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:withName:", v23, CFSTR("source"));

      }
      if (SBPeekConfigurationIsValid(self->_peekConfiguration))
      {
        SBStringForPeekConfiguration(self->_peekConfiguration);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:withName:", v24, CFSTR("peekConfiguration"));

      }
      bundleIdentifierForAppExpose = self->_bundleIdentifierForAppExpose;
      if (bundleIdentifierForAppExpose)
        objc_msgSend(v4, "appendString:withName:", bundleIdentifierForAppExpose, CFSTR("bundleIdentifierForAppExpose"));
      v26 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_sceneUpdatesOnly, CFSTR("sceneUpdatesOnly"), 1);
      v27 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_fenceSceneUpdate, CFSTR("fenceSceneUpdate"), 1);
      v28 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_appLaunchDuringWindowDragGesture, CFSTR("appLaunchDuringWindowDragGesture"), 1);
      animationSettings = self->_animationSettings;
      if (animationSettings)
        v30 = (id)objc_msgSend(v4, "appendObject:withName:", animationSettings, CFSTR("animationSettings"));
      v31 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_retainsSiri, CFSTR("retainsSiri"), 1);
      return v4;
  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSwitcherTransitionRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SBMutableSwitcherTransitionRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  -[SBSwitcherTransitionRequest appLayout](self, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherTransitionRequest setAppLayout:](v4, "setAppLayout:", v5);

  -[SBSwitcherTransitionRequest activatingDisplayItem](self, "activatingDisplayItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherTransitionRequest setActivatingDisplayItem:](v4, "setActivatingDisplayItem:", v6);

  -[SBSwitcherTransitionRequest setAppLayoutEnvironment:](v4, "setAppLayoutEnvironment:", -[SBSwitcherTransitionRequest appLayoutEnvironment](self, "appLayoutEnvironment"));
  -[SBSwitcherTransitionRequest setPreferredInterfaceOrientation:](v4, "setPreferredInterfaceOrientation:", -[SBSwitcherTransitionRequest preferredInterfaceOrientation](self, "preferredInterfaceOrientation"));
  -[SBSwitcherTransitionRequest setUnlockedEnvironmentMode:](v4, "setUnlockedEnvironmentMode:", -[SBSwitcherTransitionRequest unlockedEnvironmentMode](self, "unlockedEnvironmentMode"));
  -[SBSwitcherTransitionRequest setFloatingConfiguration:](v4, "setFloatingConfiguration:", -[SBSwitcherTransitionRequest floatingConfiguration](self, "floatingConfiguration"));
  -[SBSwitcherTransitionRequest setFloatingSwitcherVisible:](v4, "setFloatingSwitcherVisible:", -[SBSwitcherTransitionRequest floatingSwitcherVisible](self, "floatingSwitcherVisible"));
  -[SBSwitcherTransitionRequest setAnimationDisabled:](v4, "setAnimationDisabled:", -[SBSwitcherTransitionRequest animationDisabled](self, "animationDisabled"));
  -[SBSwitcherTransitionRequest setAutoPIPDisabled:](v4, "setAutoPIPDisabled:", -[SBSwitcherTransitionRequest autoPIPDisabled](self, "autoPIPDisabled"));
  -[SBSwitcherTransitionRequest setSource:](v4, "setSource:", -[SBSwitcherTransitionRequest source](self, "source"));
  -[SBSwitcherTransitionRequest setPeekConfiguration:](v4, "setPeekConfiguration:", -[SBSwitcherTransitionRequest peekConfiguration](self, "peekConfiguration"));
  -[SBSwitcherTransitionRequest bundleIdentifierForAppExpose](self, "bundleIdentifierForAppExpose");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherTransitionRequest setBundleIdentifierForAppExpose:](v4, "setBundleIdentifierForAppExpose:", v7);

  -[SBSwitcherTransitionRequest setEntityInsertionPolicy:](v4, "setEntityInsertionPolicy:", -[SBSwitcherTransitionRequest entityInsertionPolicy](self, "entityInsertionPolicy"));
  -[SBSwitcherTransitionRequest setSceneUpdatesOnly:](v4, "setSceneUpdatesOnly:", -[SBSwitcherTransitionRequest sceneUpdatesOnly](self, "sceneUpdatesOnly"));
  -[SBSwitcherTransitionRequest setFenceSceneUpdate:](v4, "setFenceSceneUpdate:", -[SBSwitcherTransitionRequest fenceSceneUpdate](self, "fenceSceneUpdate"));
  -[SBSwitcherTransitionRequest setPreventSwitcherRecencyModelUpdates:](v4, "setPreventSwitcherRecencyModelUpdates:", -[SBSwitcherTransitionRequest preventSwitcherRecencyModelUpdates](self, "preventSwitcherRecencyModelUpdates"));
  -[SBSwitcherTransitionRequest animationSettings](self, "animationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherTransitionRequest setAnimationSettings:](v4, "setAnimationSettings:", v8);

  -[SBSwitcherTransitionRequest setAppLaunchDuringWindowDragGesture:](v4, "setAppLaunchDuringWindowDragGesture:", -[SBSwitcherTransitionRequest isAppLaunchDuringWindowDragGesture](self, "isAppLaunchDuringWindowDragGesture"));
  -[SBSwitcherTransitionRequest setRetainsSiri:](v4, "setRetainsSiri:", -[SBSwitcherTransitionRequest retainsSiri](self, "retainsSiri"));
  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void)setAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_appLayout, a3);
}

- (SBDisplayItem)activatingDisplayItem
{
  return self->_activatingDisplayItem;
}

- (void)setActivatingDisplayItem:(id)a3
{
  objc_storeStrong((id *)&self->_activatingDisplayItem, a3);
}

- (int64_t)appLayoutEnvironment
{
  return self->_appLayoutEnvironment;
}

- (void)setAppLayoutEnvironment:(int64_t)a3
{
  self->_appLayoutEnvironment = a3;
}

- (int64_t)unlockedEnvironmentMode
{
  return self->_unlockedEnvironmentMode;
}

- (void)setUnlockedEnvironmentMode:(int64_t)a3
{
  self->_unlockedEnvironmentMode = a3;
}

- (int64_t)preferredInterfaceOrientation
{
  return self->_preferredInterfaceOrientation;
}

- (void)setPreferredInterfaceOrientation:(int64_t)a3
{
  self->_preferredInterfaceOrientation = a3;
}

- (int64_t)floatingConfiguration
{
  return self->_floatingConfiguration;
}

- (void)setFloatingConfiguration:(int64_t)a3
{
  self->_floatingConfiguration = a3;
}

- (int64_t)floatingSwitcherVisible
{
  return self->_floatingSwitcherVisible;
}

- (void)setFloatingSwitcherVisible:(int64_t)a3
{
  self->_floatingSwitcherVisible = a3;
}

- (int64_t)animationDisabled
{
  return self->_animationDisabled;
}

- (void)setAnimationDisabled:(int64_t)a3
{
  self->_animationDisabled = a3;
}

- (int64_t)autoPIPDisabled
{
  return self->_autoPIPDisabled;
}

- (void)setAutoPIPDisabled:(int64_t)a3
{
  self->_autoPIPDisabled = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)peekConfiguration
{
  return self->_peekConfiguration;
}

- (void)setPeekConfiguration:(int64_t)a3
{
  self->_peekConfiguration = a3;
}

- (NSString)bundleIdentifierForAppExpose
{
  return self->_bundleIdentifierForAppExpose;
}

- (void)setBundleIdentifierForAppExpose:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)entityInsertionPolicy
{
  return self->_entityInsertionPolicy;
}

- (void)setEntityInsertionPolicy:(int64_t)a3
{
  self->_entityInsertionPolicy = a3;
}

- (BOOL)preventSwitcherRecencyModelUpdates
{
  return self->_preventSwitcherRecencyModelUpdates;
}

- (void)setPreventSwitcherRecencyModelUpdates:(BOOL)a3
{
  self->_preventSwitcherRecencyModelUpdates = a3;
}

- (BOOL)sceneUpdatesOnly
{
  return self->_sceneUpdatesOnly;
}

- (void)setSceneUpdatesOnly:(BOOL)a3
{
  self->_sceneUpdatesOnly = a3;
}

- (BOOL)fenceSceneUpdate
{
  return self->_fenceSceneUpdate;
}

- (void)setFenceSceneUpdate:(BOOL)a3
{
  self->_fenceSceneUpdate = a3;
}

- (BOOL)isAppLaunchDuringWindowDragGesture
{
  return self->_appLaunchDuringWindowDragGesture;
}

- (void)setAppLaunchDuringWindowDragGesture:(BOOL)a3
{
  self->_appLaunchDuringWindowDragGesture = a3;
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_animationSettings, a3);
}

- (BOOL)retainsSiri
{
  return self->_retainsSiri;
}

- (void)setRetainsSiri:(BOOL)a3
{
  self->_retainsSiri = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForAppExpose, 0);
  objc_storeStrong((id *)&self->_activatingDisplayItem, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
