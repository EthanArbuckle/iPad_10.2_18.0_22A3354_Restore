@implementation SBSlideOverPeekSwitcherModifier

- (SBSlideOverPeekSwitcherModifier)initWithAppLayout:(id)a3 peekConfiguration:(int64_t)a4 environmentMode:(int64_t)a5 fromFloatingConfiguration:(int64_t)a6
{
  id v12;
  SBSlideOverPeekSwitcherModifier *v13;
  uint64_t v14;
  SBAppSwitcherSettings *switcherSettings;
  SBActiveAppLayoutFloatingSwitcherModifier *v16;
  SBActiveAppLayoutFloatingSwitcherModifier *floorModifier;
  void *v19;
  objc_super v20;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSlideOverPeekSwitcherModifier.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peekingAppLayout"));

  }
  v20.receiver = self;
  v20.super_class = (Class)SBSlideOverPeekSwitcherModifier;
  v13 = -[SBSwitcherModifier init](&v20, sel_init);
  if (v13)
  {
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v14 = objc_claimAutoreleasedReturnValue();
    switcherSettings = v13->_switcherSettings;
    v13->_switcherSettings = (SBAppSwitcherSettings *)v14;

    objc_storeStrong((id *)&v13->_peekingAppLayout, a3);
    v13->_peekConfiguration = a4;
    v13->_environmentMode = a5;
    v13->_fromFloatingConfiguration = a6;
    v16 = -[SBActiveAppLayoutFloatingSwitcherModifier initWithActiveAppLayout:floatingConfiguration:environmentMode:]([SBActiveAppLayoutFloatingSwitcherModifier alloc], "initWithActiveAppLayout:floatingConfiguration:environmentMode:", v12, 2, a5);
    floorModifier = v13->_floorModifier;
    v13->_floorModifier = v16;

    -[SBChainableModifier addChildModifier:](v13, "addChildModifier:", v13->_floorModifier);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)-[SBAppLayout copy](self->_peekingAppLayout, "copy");
  v6 = (void *)objc_msgSend(v4, "initWithAppLayout:peekConfiguration:environmentMode:fromFloatingConfiguration:", v5, self->_peekConfiguration, self->_environmentMode, self->_fromFloatingConfiguration);

  return v6;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  int64_t peekConfiguration;
  double MaxX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  v24.receiver = self;
  v24.super_class = (Class)SBSlideOverPeekSwitcherModifier;
  -[SBSlideOverPeekSwitcherModifier frameForIndex:](&v24, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBSlideOverPeekSwitcherModifier appLayouts](self, "appLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isEqual:", self->_peekingAppLayout))
  {
    peekConfiguration = self->_peekConfiguration;
    if (peekConfiguration == 3)
    {
      if (!-[SBSlideOverPeekSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
      {
LABEL_7:
        -[SBSlideOverPeekSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
        MaxX = CGRectGetMaxX(v25);
        -[SBAppSwitcherSettings peekInsetWidth](self->_switcherSettings, "peekInsetWidth");
        v6 = MaxX - v17;
        goto LABEL_9;
      }
      peekConfiguration = self->_peekConfiguration;
    }
    if (peekConfiguration != 2 || !-[SBSlideOverPeekSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    {
      -[SBAppSwitcherSettings peekInsetWidth](self->_switcherSettings, "peekInsetWidth");
      v19 = v18;
      v26.origin.x = v6;
      v26.origin.y = v8;
      v26.size.width = v10;
      v26.size.height = v12;
      v6 = v19 - CGRectGetWidth(v26);
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_9:

  v20 = v6;
  v21 = v8;
  v22 = v10;
  v23 = v12;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (double)homeScreenAlpha
{
  return 1.0;
}

- (double)homeScreenScale
{
  return 1.0;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (double)homeScreenBackdropBlurProgress
{
  return 0.0;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  return 1;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (id)keyboardSuppressionMode
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[SBSlideOverPeekSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:](SBSwitcherKeyboardSuppressionMode, "newSuppressionModeForSwitcherScenesFromAppLayouts:", v4);

  objc_msgSend(v5, "setApplyAssertionEvenIfAppIsHostingTheKeyboard:", 1);
  return v5;
}

- (id)visibleHomeAffordanceLayoutElements
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSlideOverPeekSwitcherModifier;
  -[SBSlideOverPeekSwitcherModifier visibleHomeAffordanceLayoutElements](&v6, sel_visibleHomeAffordanceLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObject:", self->_peekingAppLayout);
  return v4;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  return 0;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 0;
}

- (double)dockProgress
{
  return 1.0;
}

- (int64_t)dockUpdateMode
{
  return 2;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 0;
}

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  return 0.0;
}

- (unint64_t)slideOverTongueDirection
{
  if (SBFloatingConfigurationIsLeft(self->_fromFloatingConfiguration))
    return 2;
  else
    return 1;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  SBAppLayout *v8;
  void *v9;
  void *v10;
  SBAppLayout *v11;
  void *v12;
  SBPerformTransitionSwitcherEventResponse *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", self->_peekingAppLayout);

  if (v6)
  {
    -[SBAppLayout itemForLayoutRole:](self->_peekingAppLayout, "itemForLayoutRole:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [SBAppLayout alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v8, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v10, 1, 1, -[SBSlideOverPeekSwitcherModifier displayOrdinal](self, "displayOrdinal"));

    +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAppLayout:", v11);
    objc_msgSend(v12, "setPeekConfiguration:", 1);
    objc_msgSend(v12, "setRetainsSiri:", -[SBSlideOverPeekSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
    v13 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v12, 0);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorModifier, 0);
  objc_storeStrong((id *)&self->_peekingAppLayout, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
}

@end
